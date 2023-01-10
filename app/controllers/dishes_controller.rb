class DishesController < ApplicationController
  def show
    # require 'pry';binding.pry
    @dish = Dish.find(params[:id])
  end

  def create
    # require 'pry';binding.pry
    chef = Chef.find(params[:chef_id])
    dish = Dish.find(params[:dish_id])
    chef.dishes << dish
    
    redirect_to chef_path(chef)
  end

  # private
  # def dish_params
  #   params.permit(:name, :description, :chef)
  # end
end