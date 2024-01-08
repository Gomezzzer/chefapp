class Dish
  attr_accessor :name, :category, :chef_recommendation

  def initialize(name, category)
    @name = name
    @category = category
    @chef_recommendation = false
  end
end
