require 'spec_helper'

describe 'Recipes' do
  let(:user) { create :user, password: 'password' }
  let(:recipe) { create(:recipe, name: 'Yogurt', chef_id: user.chef.id) }

  it 'checks title on recipes index page' do
    visit '/recipes'
    expect(page).to have_selector('h1', text: 'All recipes')
  end

  it 'checks title on recipe show page' do
    visit "/recipes/#{recipe.id}"
    expect(page).to have_selector('h1', text: recipe.name)
  end

  it 'checks posted time' do
    visit "/recipes/#{recipe.id}"
    expect(page).to have_content 'Posted by: less than a minute ago'
  end

  context 'privacy' do
    let(:user2) { create :user, email: 'another@gmail.com', password: 'password' }
    let(:admin) { create :user, email: 'admin@gmail.com', password: 'top_secret', admin: true }

    it 'checks manage actions for owner' do
      login(user.email, 'password')
      visit "/recipes/#{recipe.id}"
      expect(page).to have_content 'Edit'
      expect(page).to have_content 'Delete'
    end

    it 'checks manage actions for admin' do
      login(admin.email, 'top_secret')
      visit "/recipes/#{recipe.id}"
      expect(page).to have_content 'Edit'
      expect(page).to have_content 'Delete'
    end

    it 'checks hidden actions for another user(not owner)' do
      login(user2.email, 'password')
      visit "/recipes/#{recipe.id}"
      expect(page).not_to have_content 'Edit'
      expect(page).not_to have_content 'Delete'
    end

    it 'checks hidden actions for guest' do
      visit "/recipes/#{recipe.id}"
      expect(page).not_to have_content 'Edit'
      expect(page).not_to have_content 'Delete'
    end
  end

  context 'votes' do
    it 'checks hidden vote actions for a guest' do
      expect(page).to_not have_selector('.like')
      expect(page).to_not have_selector('.dislike')
    end

    it 'checks avaliable vote actions for a current user' do
      login(user.email, 'password')
      expect(page).to have_selector('h1')
    end

    it 'checks flash success notice after liked' do
      login(user.email, 'password')
      visit "/recipes/#{recipe.id}"
      page.find("#like").click
      expect(page).to have_content 'You have liked this recipe'
    end

    it 'checks flash success notice after disliked' do
      login(user.email, 'password')
      visit "/recipes/#{recipe.id}"
      page.find("#dislike").click
      expect(page).to have_content 'You have disliked this recipe'
    end

    it 'checks flash error after twice liked' do
      login(user.email, 'password')
      visit "/recipes/#{recipe.id}"
      page.find("#like").click
      page.find("#like").click
      expect(page).to have_content 'You already have liked this recipe'
    end

    it 'checks flash error after twice disliked' do
      login(user.email, 'password')
      visit "/recipes/#{recipe.id}"
      page.find("#dislike").click
      page.find("#dislike").click
      expect(page).to have_content 'You already have disliked this recipe'
    end

    it 'checks counts after liked' do
      login(user.email, 'password')
      visit "/recipes/#{recipe.id}"
      page.find("#like").click
      expect(page).to have_selector('.like-count', text: 1)
      expect(page).to have_selector('.dislike-count', text: 0)
    end

    it 'checks counts after disliked' do
      login(user.email, 'password')
      visit "/recipes/#{recipe.id}"
      page.find("#dislike").click
      expect(page).to have_selector('.like-count', text: 0)
      expect(page).to have_selector('.dislike-count', text: 1)
    end

    it 'checks alghoritm of proccess after both actions did' do
      login(user.email, 'password')
      visit "/recipes/#{recipe.id}"

      page.find("#like").click
      expect(page).to have_selector('.like-count', text: 1)
      expect(page).to have_selector('.dislike-count', text: 0)
      expect(page).to have_content 'You have liked this recipe'

      page.find("#dislike").click
      expect(page).to have_selector('.like-count', text: 0)
      expect(page).to have_selector('.dislike-count', text: 1)
      expect(page).to have_content 'You have disliked this recipe'
    end
  end
end
