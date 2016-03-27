require 'spec_helper'

describe Chef do
  let(:user) { create :user } 
  let(:chef) { create :chef, user_id: user.id } 

  it "checks validations" do
    expect(chef.valid?).to be true
  end

  it 'checks serial number by default' do
    user2 = create :user
    expect(user2.chef.name).to eq 'Chef №1'
  end
end