require 'rails_helper'

RSpec.describe "Dish show page" do

  describe "As a visitor when I visit the dish's show page" do
    
    it "shows the dish's name and description" do
      jan = Chef.create!(name: "Jan's Chicken")
      dish_1 = Dish.create!(name: "Jan's Chicken", description: "Very bland chicken, slightly overcooked.", chef: jan)

      visit dish_path(dish_1)

      expect(page).to have_content("Jan's Chicken")
      expect(page).to have_content("Very bland chicken, slightly overcooked.")
    end

    it "shows a list of ingredients for that dish" do
      jan = Chef.create!(name: "Jan's Chicken")
      dish_1 = Dish.create!(name: "Jan's Chicken", description: "Very bland chicken, slightly overcooked.", chef: jan)
      ing_1 = Ingredient.create!(name: "Chicken Breast", calories: 120)
      ing_2 = Ingredient.create!(name: "Pepper", calories: 5)
      
      dish_1.ingredients << [ing_1, ing_2]

      visit dish_path(dish_1)

      within('#dish_ingredient_list') do
        expect(page).to have_content("Chicken Breast")
        expect(page).to have_content("Pepper")
      end
    end

    it "shows a total calorie count for that dish and the chef's name" do
      jan = Chef.create!(name: "Jan's Chicken")
      dish_1 = Dish.create!(name: "Jan's Chicken", description: "Very bland chicken, slightly overcooked.", chef: jan)

      visit dish_path(dish_1)
      
      expect(page).to have_content("Jan's Chicken") 
      expect(page).to have_content("Jan's Chicken") 
    end
  end
end



