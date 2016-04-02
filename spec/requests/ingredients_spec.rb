require 'spec_helper'

describe 'Ingredients' do
  it 'checks title on index page' do
    visit '/ingredients'
    expect(page).to have_content 'All ingredients'
  end

  it 'checks show page with friendly_id' do
    Ingredient.create(name: 'Banana')
    visit '/ingredients/banana'
    expect(page).to have_selector('h1', 'Banana')
  end
end