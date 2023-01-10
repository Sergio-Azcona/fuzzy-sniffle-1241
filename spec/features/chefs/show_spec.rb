require 'rails_helper'

RSpec.describe "Chef show page" do
  before (:each) do
    @chef_1 = Chef.create!(name: "Chef Primo 1")
    @chef_2 = Chef.create!(name: "Chef Grill 2")
    @chef_3 = Chef.create!(name: "Chef Zing 3")

    @pizza_1 =  @chef_1.dishes.create!(name: "numero 1 pizza", description: "cheese pizza")
    @pasta_2 =  @chef_1.dishes.create!(name: "pasta 2", description: "pasta and sauce")
    @fish_3 =  @chef_1.dishes.create!(name: "saute fish 3", description: "fresh fish from the sea in lemon sauce")

    @burger_4 =  @chef_2.dishes.create!(name: "burger 4", description: "burger with cheese and fries")
    @hotdog_5 =  @chef_2.dishes.create!(name: "hot dog 5", description: "2 hot dogs with with fries")
    @chix_fingers_6 =  @chef_2.dishes.create!(name: "6 chicken finger", description: "deep fried fingers for life")
    
    @ingredient_1 = Ingredient.create!(name: "salt", calories: 10)
    @ingredient_2 = Ingredient.create!(name: "bread", calories: 80)
    @ingredient_3 = Ingredient.create!(name: "butter", calories: 50)
    @ingredient_4 = Ingredient.create!(name: "pasta", calories: 150)
    @ingredient_6 = Ingredient.create!(name: "cheese", calories: 60)
    @ingredient_7 = Ingredient.create!(name: "potatos", calories: 110)
    @ingredient_8 = Ingredient.create!(name: "lemon juice", calories: 40)
    @ingredient_9 = Ingredient.create!(name: "wine", calories: 130)

    @dish_ingredients_1 = DishIngredient.create!(dish: @pizza_1, ingredient: @ingredient_1)
    @dish_ingredients_2 = DishIngredient.create!(dish: @pizza_1, ingredient: @ingredient_2)
    @dish_ingredients_3 = DishIngredient.create!(dish: @pasta_2, ingredient: @ingredient_4)
    @dish_ingredients_4 = DishIngredient.create!(dish: @pizza_1, ingredient: @ingredient_3)
    @dish_ingredients_5 = DishIngredient.create!(dish: @pasta_2, ingredient: @ingredient_6)
    @dish_ingredients_6 = DishIngredient.create!(dish: @pizza_1, ingredient: @ingredient_6)
    @dish_ingredients_7 = DishIngredient.create!(dish: @pasta_2, ingredient: @ingredient_8)
    @dish_ingredients_8 = DishIngredient.create!(dish: @burger_4, ingredient: @ingredient_2)
    @dish_ingredients_9 = DishIngredient.create!(dish: @pasta_2, ingredient: @ingredient_9)
    @dish_ingredients_10 = DishIngredient.create!(dish: @burger_4, ingredient: @ingredient_7)
  
    visit chef_path(@chef_2)
  end

  it "displays the chef's name and lists all chef's dishes" do
    # save_and_open_page
    expect(page).to have_content(@chef_2.name)
    expect(page).to have_content(@burger_4.name)
    expect(page).to have_content(@hotdog_5.name)
  end

  it "page has a form that allows user to associate new dishes with this chef" do
    expect(page).to_not have_content(@pizza_1.name)
    
    expect(page).to have_field(:dish_id)
    fill_in(:dish_id, with: @pizza_1.id)
    click_button("Add Dish")

    expect(current_path).to eq(chef_path(@chef_2))
    expect(page).to have_content(@pizza_1.name)
  end

  it "has a link to the chef's dishes ingredients" do
# save_and_open_page
    expect(page).to have_link("Chef's Favorite Ingredients")

    click_link("Chef's Favorite Ingredients")
    # require 'pry';binding.pry
    expect(current_path).to eq(chef_ingredients_path(@chef_2))
  end

end