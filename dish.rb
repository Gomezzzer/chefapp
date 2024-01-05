# dish.rb

class Dish
  attr_accessor :name, :category, :chef_recommendation

  def initialize(name, category)
    @name = name
    @category = category
    @chef_recommendation = false
  end

  def recommend_dish
    @chef_recommendation = true
    puts "#{name} has been recommended by the chef!"
  end
end
