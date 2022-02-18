require 'rails_helper'

RSpec.describe Entitygroup, type: :model do
  it 'It is valid having group id and entity id' do
    @user = User.create(name: 'User 1', email: 'email@e.com', password: 'password', confirmed_at: Time.now)
    @group = Group.create!(name: 'Group 1', icon: 'henry@gmail.com', user_id: @user.id)
    @entity = Entity.create!(name: 'Ent 1', amount: 200, user_id: @user.id)
    @ent = Entitygroup.create!(group_id: @group.id, entity_id: @entity.id)
    expect(@ent).to be_valid
  end

  it 'It is invalid having group id or entity id as null' do
    @user = User.create(name: 'User 1', email: 'email@e.com', password: 'password', confirmed_at: Time.now)
    @group = Group.create!(name: 'Group 1', icon: 'henry@gmail.com', user_id: @user.id)
    @entity = Entity.create!(name: 'Ent 1', amount: 200, user_id: @user.id)
    expect { Entitygroup.create!(group_id: nil, entity_id: @entity.id) }.to raise_error
  end
end
