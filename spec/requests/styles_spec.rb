require 'spec_helper'

describe 'Styles' do
  let!(:style) { create(:style, name: 'American') }
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, chef_id: user.chef.id, name: 'Hamburger') }

  it 'checks title on index page' do
    visit '/styles'
    expect(page).to have_content 'All styles'
  end

  it 'checks show page with friendly_id' do
    visit '/styles/american'
    expect(page).to have_selector('h1', 'American')
  end

  it 'checks of exisiting recipe with certain style' do
    RecipeStyle.create(recipe_id: recipe.id, style_id: style.id)
    visit '/styles/american'
    expect(page).to have_content 'Hamburger'
  end
end