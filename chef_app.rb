# chef_app.rb
require_relative 'dish'  # Include the Dish class

class ChefApp
  attr_accessor :dishes

  def initialize
    @dishes = []
  end

  def add_dish(name, category)
    dish = Dish.new(name, category)
    @dishes << dish
    puts "#{name} has been added to the menu."
  end

  def view_menu
    puts 'Menu:'
    @dishes.each do |dish|
      recommendation = dish.chef_recommendation ? '(Chef Recommended)' : ''
      puts "#{dish.name} - #{dish.category} #{recommendation}"
  end

 end
end
