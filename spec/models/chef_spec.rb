require 'spec_helper'

describe Chef do
  let(:chef) { FactoryGirl.create :chef } 

  it "checks validations" do
    expect(chef.valid?).to be true
  end

  it 'checks if format of email is invalid' do
    chef = build(:chef, email: 'test')
    expect(chef.valid?).to eq false
  end

  it 'checks if existing email' do
    chef1 = create(:chef, email: 'test@gmail.com')
    chef2 = build(:chef, email: 'test@gmail.com')
    expect(chef2.valid?).to eq false
  end

  it 'checks downcasing email during creating' do
    chef = create(:chef, email: 'testCAPS@gmail.com')
    expect(chef.email).to eq 'testcaps@gmail.com'
  end
end