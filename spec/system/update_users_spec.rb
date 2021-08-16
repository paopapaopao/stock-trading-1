require 'rails_helper'

RSpec.describe "Update Users", type: :system do
  subject do
    User.create(
      user_type: 'buyer',
      email: 'juan.dlc@example.com',
      password: 'password',
      first_name: 'juan',
      last_name: 'dela cruz'
    )
  end

  let :existing_user do
    User.create(
      user_type: 'buyer',
      email: 'juandlc@example.com',
      password: 'password',
      first_name: 'juan',
      last_name: 'dela cruz'
    )
  end

  before :each do
    driven_by :rack_test

    User.destroy_all
    visit edit_user_path(subject)
  end

  context 'With invalid input field values' do
    it do
      expect(page).to have_text 'Edit User'
      expect(page).to have_current_path edit_user_path(subject)

      select 'Buyer', from: 'User Type'
      fill_in 'Email', with: ''
      fill_in 'Password', with: ''
      fill_in 'First Name', with: ''
      fill_in 'Last Name', with: ''
      click_button 'Update User'
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
      expect(page).to have_content "First Name can't be blank"
      expect(page).to have_content "Last Name can't be blank"

      existing_user
      fill_in 'Email', with: existing_user.email
      click_button 'Update User'
      expect(page).to have_content 'Email has already been taken'

      fill_in 'Password', with: 'a' * 7
      click_button 'Update User'
      expect(page).to have_content 'Password is too short (minimum is 8 characters)'

      fill_in 'Password', with: 'a' * 51
      click_button 'Update User'
      expect(page).to have_content 'Password is too long (maximum is 50 characters)'
    end
  end

  context 'With valid input field values' do
    it do
      expect(page).to have_text 'Edit User'
      expect(page).to have_current_path edit_user_path(subject)

      select 'Broker', from: 'User Type'
      fill_in 'Email', with: 'juan_dlc@example.com'
      fill_in 'Password', with: 'drowssap'
      fill_in 'First Name', with: 'one'
      fill_in 'Last Name', with: 'de la cruz'
      click_button 'Update User'
      expect(page).to have_current_path user_path(User.last)
    end
  end
end
