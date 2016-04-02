require 'spec_helper'

describe 'Ingredients' do
  let!(:ingredient) { create(:ingredient, name: 'Banana') }
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, chef_id: user.chef.id, name: 'Smoozy') }

  it 'checks title on index page' do
    visit '/ingredients'
    expect(page).to have_content 'All ingredients'
  end

  it 'checks show page with friendly_id' do
    visit '/ingredients/banana'
    expect(page).to have_selector('h1', 'Banana')
  end

  it 'checks of exisiting recipe with certain ingredient' do
    RecipeIngredient.create(recipe_id: recipe.id, ingredient_id: ingredient.id)
    visit '/ingredients/banana'
    expect(page).to have_content 'Smoozy'
  end
end