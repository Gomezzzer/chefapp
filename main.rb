# main.rb
require_relative 'chef_app' 

# Example usage:
chef_app = ChefApp.new
chef_app.add_dish('Spaghetti Bolognese', 'Pasta')
chef_app.add_dish('Grilled Salmon', 'Seafood')


puts 'Enter the name of the dish:'
dish_name = gets.chomp

puts 'Enter the category of the dish:'
dish_category = gets.chomp

chef_app.add_dish(dish_name, dish_category)

chef_app.view_menu
