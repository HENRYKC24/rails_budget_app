require 'rails_helper'

RSpec.feature 'Group index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'henry', email: 'henry@mail.com', password: '123456', confirmed_at: Time.now)
    @group = Group.create(user_id: @user.id, name: 'Travel', icon: 'profile.jpg')
    @entity = Entity.create(name: 'India', amount: 1500, user_id: @user.id)
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit user_category_entities_path(@user.id, @group.id)
  end

  scenario 'display My Groups on page' do
    expect(page).to have_content('Transaction')
    expect(page).to have_content('Total Budget')
  end

  scenario 'display Group details on page' do
    expect(page).to have_content @group.name
  end

  scenario 'display Add New transaction button on page' do
    expect(page).to have_button 'add a new transaction'
  end

  scenario 'When I click on add a new transaction, I am redirected to that Transaction\'s page.' do
    click_link('add a new transaction')
    expect(page).to have_current_path new_user_category_entity_path(@user.id, @group.id)
  end
end
