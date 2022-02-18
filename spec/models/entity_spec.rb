require 'rails_helper'

RSpec.describe Entity, type: :model do
  it 'It is valid having amount and name' do
    @user = User.create(name: 'User 1', email: 'email@e.com', password: 'password', confirmed_at: Time.now)
    @group = Group.create!(name: 'Group 1', icon: 'henry@gmail.com', user_id: @user.id)
    @entity = Entity.create!(name: 'Ent 1', amount: 200, user_id: @user.id)

    expect(@entity).to be_valid
  end

end
