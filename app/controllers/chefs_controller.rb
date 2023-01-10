class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end

  def new
    @new_chef = Chef.new
  end
end