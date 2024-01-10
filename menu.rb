require_relative 'dish'

class Menu
  attr_accessor :dishes

  def initialize
    @dishes = []
    puts 'Welcome to Chef App!'
  end

  def run
    loop do
      puts 'Options:'
      puts '1. Example Menu'
      puts '2. Add Dish'
      puts '3. View Menu'
      puts '4. Recommend Dish'
      puts '5. Exit'

      choice = gets.chomp.to_i

      case choice
      when 1
        example_menu
      when 2
        user_add_dish
      when 3
        view 
      when 4
        recommend_dish
      when 5
        puts 'Exiting the loop. Goodbye!'
        break
      else
        puts 'Invalid option. Please choose a valid option.'
      end
    end
  end


  def add_dish(name, category)
    dish = Dish.new(name, category)
    @dishes << dish
    puts "You have #{name} on the menu."
  end

  def recommend_dish
    puts 'Enter the name of the dish to recommend:'
    dish_name = gets.chomp
  
    dish = find_dish_by_name(dish_name)
  
    if dish
      dish.chef_recommendation = true
      puts "#{dish.name} has been recommended by the chef!"
    else
      puts "Dish '#{dish_name}' not found in the menu."
    end
  end
  

  def view
    puts 'Menu:'
    @dishes.each do |dish|
      recommendation = dish.chef_recommendation ? '(Chef Recommended)' : ''
      puts "#{dish.name} - #{dish.category} #{recommendation}"
    end
  end

  def user_add_dish
    puts 'Enter the name of the dish (type "exit" to finish):'
    dish_name = gets.chomp

    return if dish_name.downcase == 'exit'

    puts 'Enter the category of the dish:'
    dish_category = gets.chomp

    add_dish(dish_name, dish_category)
  end

  def example_menu
    puts 'Example Menu:'
    puts 'Spaghetti Bolognese - Pasta'
    puts 'Grilled Salmon - Seafood'
    puts 'Escargot - Starter'
  end

  private

  def find_dish_by_name(name)
    @dishes.find { |dish| dish.name == name }
  end
end
