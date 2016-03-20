require 'spec_helper'

describe Recipe do
  let(:chef) { FactoryGirl.create(:chef) }
  let(:recipe) { FactoryGirl.create(:recipe, chef_id: chef.id) }

  it 'checks validations' do
    expect(recipe.valid?).to be true
  end
end
