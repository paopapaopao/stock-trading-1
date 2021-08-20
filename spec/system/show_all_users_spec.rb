require "rails_helper"

RSpec.describe "Show All Users", type: :system do
  before(:each) { driven_by :rack_test }

  context "Show all users" do
    it do
      visit users_path
      expect(page).to have_content "Users"
      expect(page).to have_current_path users_path
    end
  end
end
