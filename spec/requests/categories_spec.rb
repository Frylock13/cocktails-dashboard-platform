require 'spec_helper'

describe 'Categories' do
  let!(:ingredient) { create(:ingredient, name: 'Banana') }
  let(:user) { create(:user) }
  let(:admin) { create(:user, admin: true) }
  let(:recipe) { create(:recipe, chef_id: user.chef.id, name: 'Smoozy') }

  it 'checks title on index page' do
    visit '/categories'
    expect(page).to have_content 'All categories'
  end

  it 'checks title on category page' do
    Category.create(name: 'Beer', slug: 'beer')
    visit '/categories/beer'
    expect(page).to have_content 'Beer'
  end

  context 'not admin' do
    before(:each) do
      login(user.email, user.password)
    end

    it 'checks for edit button' do
      visit '/categories'
      expect(page).to_not have_content 'Edit'
    end
  end

  context 'admin' do
    before(:each) do
      login(admin.email, admin.password)
    end

    it 'checks for edit button' do
      visit '/categories'
      expect(page).to have_content 'Edit'
    end
  end
end