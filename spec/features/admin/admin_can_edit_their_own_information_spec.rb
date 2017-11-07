require 'rails_helper'

describe "When an admin signs in" do

  before(:each) do
    @user = User.create(username: "default_person_1",
                        password: "password",
                        full_name: "Default Person",
                        address: "2020 Longest Rd, Denver, CO")
    @admin = User.create(username: "admin",
                        password: "password",
                        full_name: "Admin Person",
                        address: "2020 Longest Rd, Denver, CO",
                        role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_dashboard_path
  end

  describe "clicks 'Edit Account', changes information, and clicks Update User" do
    it "the admin has changed their own information" do
      click_link("Edit Account")

      expect(current_path).to eq(edit_user_path(@admin))
      fill_in "user[username]", with: "new_name"
      fill_in "user[password]", with: "new_password"
      fill_in "user[full_name]", with: "New Name"
      fill_in "user[address]", with: "1 Market St., Denver, CO"

      click_button "Update User"

      expect(User.last.username).to eq("new_name")
      expect(User.last.full_name).to eq("New Name")
      expect(User.last.address).to eq("1 Market St., Denver, CO")
      expect(current_path).to eq(admin_dashboard_path)
    end
  end

  it "the admin cannot edit another user's information" do
    visit edit_user_path(@user)

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
