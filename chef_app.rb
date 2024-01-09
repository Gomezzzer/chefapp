# This file should be the same name as the class (so rename file to menu.rb)

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

  # Can probably rename this `view` since it's in the Menu class
  def view_menu
    puts 'Menu:'
    @dishes.each do |dish|
      recommendation = dish.chef_recommendation ? '(Chef Recommended)' : ''
      puts "#{dish.name} - #{dish.category} #{recommendation}"
    end
  end

  # Can probably just call this `run`
  def run_menu_app

    # Maybe move these 3 dishes to an 'example' method?
    add_dish('Spaghetti Bolognese', 'Pasta')
    add_dish('Grilled Salmon', 'Seafood')
    add_dish('Escargot', 'Starter') 

    # Maybe add a case-when or if-else chain with a few options for the user to choose (add dish, example menu, view menu, recommend dish, exit, etc.)
    loop do
      puts 'Enter the name of the dish (type "exit" to finish):'
      dish_name = gets.chomp

      break if dish_name.downcase == 'exit'

      puts 'Enter the category of the dish:'
      dish_category = gets.chomp

      add_dish(dish_name, dish_category)
    end

    # Maybe create a 'recommend dish' option for the user
    recommend_dish('Spaghetti Bolognese')

    # Maybe create a 'view menu' option for the user
    view_menu
  end

  private

  def find_dish_by_name(name)
    @dishes.find { |dish| dish.name == name }
  end
end
