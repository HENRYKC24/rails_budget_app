require 'rails_helper'

RSpec.describe User, type: :model do
  it 'It is invalid having the name attribute as null' do
    expect { User.create(name: nil, email: 'henry@yahoo.com', password: 'kkkkkk') }.to raise_error
  end

  it 'Valid if name is present' do
    @user = User.new(name: 'Henry', email: 'henry@yahoo.com', password: 'kkkkkk')
    expect(@user).to be_valid
  end

  it 'It is invalid omitting the email attribute' do
    @user = User.create(name: 'Kc', password: 'kkkkkk')
    expect(@user).to_not be_valid
  end

  it 'Valid if email is present' do
    @user = User.new(name: 'Kelechukwu', email: 'kc@gmail.com', password: 'kkkkkk')
    expect(@user).to be_valid
  end

  it 'It is invalid omitting the password attribute' do
    @user = User.create(name: 'Henry', email: 'henry@gmail.com')
    expect(@user).to_not be_valid
  end

  it 'Valid if password is present' do
    @user = User.new(name: 'Henry Kc', email: 'hkc@gmail.com', password: 'kkkkkk')
    expect(@user).to be_valid
  end
end
