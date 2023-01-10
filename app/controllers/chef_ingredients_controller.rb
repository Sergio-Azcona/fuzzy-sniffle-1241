class ChefIngredientsController < ApplicationController
  def index
    # params
    @chef = Chef.find(params[:chef_id])
    # require 'pry';binding.pry
    # @chef_ingredients = Ingredient.find(params[:chef_id])
    # @chef.fav_ingredients
  end

end