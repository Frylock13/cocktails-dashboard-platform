require 'spec_helper'

describe 'Recipes' do
  let(:user) { create :user }
  let(:chef) { create :chef, user_id: user.id }
  let(:recipe) { create(:recipe, name: 'Yogurt', chef_id: chef.id) }

  it 'checks title on recipes index page' do
    visit '/recipes'
    expect(page).to have_selector('h1', text: 'All recipes')
  end

  it 'checks title on show page' do
    visit "recipes/#{recipe.id}"
    expect(page).to have_selector('h1', text: 'Yogurt')
  end
end
