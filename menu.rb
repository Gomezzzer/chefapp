require_relative 'dish'

class Menu 
  attr_accessor :dishes

  def initialize
    @dishes = []
  end

  def add_dish(name, category)
    dish = Dish.new(name, category)
    @dishes << dish
    puts "You have #{name} on the menu."
  end

  def recommend_dish(dish_name)
    dish = find_dish_by_name(dish_name)
    return unless dish

    dish.chef_recommendation = true
    puts "#{dish.name} has been recommended by the chef!"
  end

  def view
    puts 'Menu:'
    @dishes.each do |dish|
      recommendation = dish.chef_recommendation ? '(Chef Recommended)' : ''
      puts "#{dish.name} - #{dish.category} #{recommendation}"
    end
  end

  def run
    add_dish('Spaghetti Bolognese', 'Pasta')
    add_dish('Grilled Salmon', 'Seafood')
    add_dish('Escargot', 'Starter') 

    loop do
      puts 'Enter the name of the dish (type "exit" to finish):'
      dish_name = gets.chomp

      break if dish_name.downcase == 'exit'

      puts 'Enter the category of the dish:'
      dish_category = gets.chomp

      add_dish(dish_name, dish_category)
    end

      recommend_dish('Spaghetti Bolognese')
      view
  end

  private

  def find_dish_by_name(name)
    @dishes.find { |dish| dish.name == name }
  end
end
