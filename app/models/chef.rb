class Chef < ApplicationRecord
  validates_presence_of :name
  
  has_many :dishes
  has_many :ingredients, through: :dishes
  has_many :dish_ingredients, through: :dishes

  def fav_ingredients
    # require 'pry';binding.pry
    self.ingredients.distinct
  end

end