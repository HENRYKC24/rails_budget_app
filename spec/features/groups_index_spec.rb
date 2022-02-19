require 'rails_helper'

RSpec.feature 'Group index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'henry', email: 'henry@mail.com', password: '123456', confirmed_at: Time.now)
    @group = Group.create(user_id: @user.id, name: 'Travel', icon: 'profile.jpg')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit user_categories_path(@user.id)
  end

  scenario 'display My Groups on page' do
    expect(page).to have_content('Budget Categories')
    expect(page).to have_content('Budget App')
  end

  scenario 'display Group details on page' do
    expect(page).to have_content @group.name
  end

  scenario 'display Add New Category button on page' do
    expect(page).to have_button 'Add a new category'
  end

  scenario 'When I click on Travel, I am redirected to that Group\'s page.' do
    click_link('Travel')
    expect(page).to have_current_path user_category_entities_path(@user.id, @group.id)
  end

  scenario 'When I click on Add a new category, I am redirected to that Group\'s page.' do
    click_link('Add a new category')
    expect(page).to have_current_path new_user_category_path(@user.id)
  end
end
