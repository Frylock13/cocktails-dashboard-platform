require 'spec_helper'

describe 'Categories' do
  let!(:ingredient) { create(:ingredient, name: 'Banana') }
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, chef_id: user.chef.id, name: 'Smoozy') }

  it 'checks title on index page' do
    visit '/categories'
    expect(page).to have_content 'All categories'
  end
end