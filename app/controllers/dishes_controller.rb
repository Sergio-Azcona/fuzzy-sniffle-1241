class DishesController < ApplicationController
  def show
    # require 'pry';binding.pry
    @dish = Dish.find(params[:id])

  end
end