require 'spec_helper'

describe User do
  let(:user) { create :user }

  it 'checks if format of email is invalid' do
    user = build(:user, email: 'test')
    expect(user.valid?).to eq false
  end

  it 'checks if existing email' do
    user1 = create(:user, email: 'test@gmail.com')
    user2 = build(:user, email: 'test@gmail.com')
    expect(user2.valid?).to eq false
  end

  it 'checks downcasing email during creating' do
    user = create(:user, email: 'testCAPS@gmail.com')
    expect(user.email).to eq 'testcaps@gmail.com'
  end

  it 'checks of creating chef profile after create user' do
    expect(user.chef.user_id).to eq user.id
  end
end