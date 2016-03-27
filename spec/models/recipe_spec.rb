require 'spec_helper'

describe Recipe do
  let(:user) { FactoryGirl.create(:user) }
  let(:recipe) { FactoryGirl.create(:recipe, chef_id: user.chef.id) }

  it 'checks validations' do
    expect(recipe.valid?).to be true
  end
end
