require 'rails_helper'

RSpec.feature 'Group index', type: :feature do
  background do
    visit new_user_session_path

    @user = User.create(name: 'henry', email: 'henry@mail.com', password: '123456')
    @group = Group.create(user_id: @user.id, name: 'Travel', icon: 'profile.jpg')
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password

    click_button 'Log in'
    visit new_user_category_path(@user.id)
  end

  scenario 'display My Groups on page' do
    expect(page).to have_content('Let\'s add a new category')
    expect(page).to have_content('Add Category')
    expect(page).to have_content('Category name')
    expect(page).to have_content('Add Icon')
  end

  scenario 'display Add New Category button on page' do
    expect(page).to have_button 'Save'
  end
end
