require 'spec_helper'

describe Recipe do
  let(:recipe) { FactoryGirl.create :recipe }

  it 'checks validations' do
    expect(recipe.valid?).to be true
  end
end
