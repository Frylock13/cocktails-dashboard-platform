require 'spec_helper'

describe 'Recipes' do

  it 'checks title on recipes index page' do
    visit '/recipes'
    expect(page).to have_selector('h1', text: 'All recipes')
  end

  context 'privacy' do
    let(:user) { create :user, password: 'password' }
    let(:user2) { create :user, email: 'another@gmail.com', password: 'password' }
    let(:recipe) { create(:recipe, name: 'Yogurt', chef_id: user.chef.id) }

    it 'checks avaliable actions for owner' do
      login(user.email, 'password')
      visit recipe_path(recipe.id)
      expect(page).to have_content 'Edit'
      expect(page).to have_content 'Delete'
    end

    it 'checks hidden actions for another user(not owner)' do
      login(user2.email, 'password')
      visit recipe_path(recipe.id)
      expect(page).not_to have_content 'Edit'
      expect(page).not_to have_content 'Delete'
    end
  end
end
