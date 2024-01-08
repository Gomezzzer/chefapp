# dish.rb

class Dish
  attr_accessor :name, :category, :chef_recommendation

  def initialize(name, category)
    @name = name
    @category = category
    @chef_recommendation = false
  end

  # maybe this could be moved to the chef_app class, eg a Chef recommends a dish
  def recommend_dish
    @chef_recommendation = true
    puts "#{name} has been recommended by the chef!"
  end
end
