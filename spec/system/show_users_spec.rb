require 'rails_helper'

RSpec.describe "Show Users", type: :system do
  subject do
    User.create(
      user_type: 'buyer',
      email: 'juan.dlc@example.com',
      password: 'password',
      first_name: 'juan',
      last_name: 'dela cruz'
    )
  end

  before(:each) { driven_by :rack_test }

  context 'Show users' do
    it do
      visit user_path(subject)
      expect(page).to have_content subject.id
      expect(page).to have_content subject.user_type
      expect(page).to have_content subject.email
      expect(page).to have_content subject.password
      expect(page).to have_content subject.first_name
      expect(page).to have_content subject.last_name
      expect(page).to have_current_path user_path(subject)
    end
  end
end
