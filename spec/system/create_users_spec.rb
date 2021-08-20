require "rails_helper"

RSpec.describe "Create Users", type: :system do
  let :existing_user do
    User.create(
      user_type: "broker",
      email: "juan_dlc@example.com",
      password: "drowssap",
      first_name: "one",
      last_name: "de la cruz",
    )
  end

  before :each do
    driven_by :rack_test

    User.destroy_all
    visit new_user_path
  end

  context "With invalid input field values" do
    it do
      expect(page).to have_content "Sign up"
      expect(page).to have_current_path new_user_path

      select "Buyer", from: "Sign up"
      fill_in "Email", with: ""
      fill_in "Password", with: ""
      fill_in "First Name", with: ""
      fill_in "Last Name", with: ""
      click_button "Sign User"
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
      expect(page).to have_content "First Name can't be blank"
      expect(page).to have_content "Last Name can't be blank"

      existing_user
      fill_in "Email", with: existing_user.email
      click_button "Sign up"
      expect(page).to have_content "Email has already been taken"

      fill_in "Password", with: "a" * 7
      click_button "Sign up"
      expect(page).to have_content "Password is too short (minimum is 8 characters)"

      fill_in "Password", with: "a" * 51
      click_button "Sign up"
      expect(page).to have_content "Password is too long (maximum is 50 characters)"
    end
  end

  # context 'With valid input field values' do
  #   it do
  #     expect(page).to have_content 'New User'
  #     expect(page).to have_current_path new_user_path

  #     select 'Buyer', from: 'User Type'
  #     fill_in 'Email', with: 'juan.dlc@example.com'
  #     fill_in 'Password', with: 'password'
  #     fill_in 'First Name', with: 'juan'
  #     fill_in 'Last Name', with: 'dela cruz'
  #     click_button 'Create User'
  #     expect(page).to have_current_path user_path(User.last)
  #   end
  # end
end
