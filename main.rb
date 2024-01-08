# main.rb
require_relative 'chef_app' 

# Maybe move the example usage to the readme OR to a method in ChefApp
# Example usage:
chef_app = ChefApp.new
chef_app.add_dish('Spaghetti Bolognese', 'Pasta')
chef_app.add_dish('Grilled Salmon', 'Seafood')

# Maybe move this to a 'run' method in ChefApp that loops
# eg https://github.com/heratyian/library-cli/blob/main/library.rb
# Then you only need to do `ChefApp.new.run` in this file
puts 'Enter the name of the dish:'
dish_name = gets.chomp

puts 'Enter the category of the dish:'
dish_category = gets.chomp

chef_app.add_dish(dish_name, dish_category) 

chef_app.dishes.first.recommend_dish

chef_app.view_menu
