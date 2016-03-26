require 'spec_helper'

describe Chef do
  let(:user) { create :user } 
  let(:chef) { create :chef, user_id: user.id } 

  it "checks validations" do
    expect(chef.valid?).to be true
  end
end