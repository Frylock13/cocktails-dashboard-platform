require 'spec_helper'

describe Chef do
  let(:chef) { FactoryGirl.create :chef } 

  it "checks validations" do
    expect(chef.valid?).to be true
  end

  it 'checks invalid email' do
    chef = Chef.create(name: Faker::Name.name, email: 'test')
    expect(chef.valid?).to eq false
  end
end