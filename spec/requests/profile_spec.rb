require 'spec_helper'

describe 'Recipes' do
  let(:user) { create :user, password: 'password' }
  let(:recipe) { create(:recipe, name: 'Yogurt', chef_id: user.chef.id) }

  before :each do
    login(user.email, 'password')
  end

  it 'checks a title on a edit profile page' do
    visit profile_path
    expect(page).to have_selector('h1', text: 'Profile')
  end

  it 'checks a name on a profile page' do
    visit profile_path
    expect(page).to have_content('Name: Chef №1')
  end

  it 'checks of updating chef name' do
    visit edit_profile_path
    fill_in 'chef_name', with: 'Fry'
    page.find("#save").click
    expect(page).to have_content('Name: Fry')
  end

  it 'checks default values likes/dislikes' do
    visit profile_path
    expect(page).to have_content('Likes: 0')
    expect(page).to have_content('Dislikes: 0')
  end

  it 'checks of increment a likes-count' do
    visit recipe_path(recipe.id)
    page.find("#like").click
    visit profile_path
    expect(page).to have_content('Likes: 1')
  end

  it 'checks of increment a likes-count' do
    visit recipe_path(recipe.id)
    page.find("#dislike").click
    visit profile_path
    expect(page).to have_content('Dislikes: 1')
  end
end
