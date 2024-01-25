# test_menu.rb
require 'minitest/autorun'
require_relative '../menu'

class TestMenu < Minitest::Test
  def setup
    @menu_app = Menu.new
  end

  def test_example_menu
    assert_output(/Example Menu:/) { @menu_app.example_menu }
  end

  def test_add_dish
    @menu_app.add_dish("Pasta Carbonara", "Pasta")
    assert_equal 1, @menu_app.dishes.size, "Dish not added successfully"
  end

  
  def test_recommend_dish
    dish = Dish.new("Recommended Dish", "Test Category")
    @menu_app.dishes << dish
  
    input_data = "Recommended Dish\n"
    
    $stdin = StringIO.new(input_data)
    
    assert_output(/Recommended Dish has been recommended by the chef!/) do
      @menu_app.recommend_dish
    end
  
    assert_equal true, dish.chef_recommendation, "Dish not recommended successfully"
  end



  def test_view_menu
    dish = Dish.new("Test Dish", "Test Category")
    @menu_app.dishes << dish

    assert_output(/Menu:/) { @menu_app.view }
    assert_output(/Test Dish - Test Category/) { @menu_app.view }
  end

  def test_user_add_dish
    $stdin = StringIO.new("Pasta Carbonara\nPasta\n")
    @menu_app.user_add_dish

    assert_equal 1, @menu_app.dishes.size, "User-added dish not added successfully"
  end

  # You can add more tests for other methods as needed

  def teardown
    $stdin = STDIN
  end
end
