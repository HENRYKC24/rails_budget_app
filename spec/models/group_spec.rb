require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'valid if name is present' do
    @user = User.create(name: 'User 1', email: 'email@e.com', password: 'password', confirmed_at: Time.now)
    @group = Group.create!(name: 'Group 1', icon: 'henry@gmail.com', user_id: @user.id)
    expect(@group).to be_valid
  end

  it 'invalid if name is null' do
    @user = User.create(name: 'User 1', email: 'email@e.com', password: 'password', confirmed_at: Time.now)
    expect { Group.create!(name: nil, icon: 'henry@gmail.com', user_id: @user.id) }.to raise_error
  end

  it 'valid if icon is present' do
    @user = User.create(name: 'User 1', email: 'email@e.com', password: 'password', confirmed_at: Time.now)
    @group = Group.create!(name: 'Group 1', icon: 'myicon.png', user_id: @user.id)
    expect(@group).to be_valid
  end

  it 'invalid if icon is null' do
    expect { Group.create!(name: 'User', icon: nil, user_id: @user.id) }.to raise_error
  end

  it 'valid if user id is present' do
    @user = User.create(name: 'User 1', email: 'email@e.com', password: 'password', confirmed_at: Time.now)
    @group = Group.create!(name: 'Group 1', icon: 'myicon.png', user_id: @user.id)
    expect(@group).to be_valid
  end

  it 'invalid if user id is null' do
    expect { Group.create!(name: 'User', icon: 'mysecond.png', user_id: nil) }.to raise_error
  end
end
