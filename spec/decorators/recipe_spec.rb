require 'spec_helper'

describe RecipeDecorator do
  let(:recipe) { FactoryGirl.build_stubbed(:recipe).decorate }

  it 'returns the displayed days' do
    expect(recipe.posted_by).to eq('Posted by: less than a minute ago')
  end
end