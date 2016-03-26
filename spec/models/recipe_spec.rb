require 'spec_helper'

describe Recipe do
  let(:user) { FactoryGirl.create(:user) }
  let(:chef) { FactoryGirl.create(:chef, user_id: user.id) }
  let(:recipe) { FactoryGirl.create(:recipe, chef_id: chef.id) }

  it 'checks validations' do
    expect(recipe.valid?).to be true
  end
end
