require 'rails_helper'

describe "When an authenticated user visits their dashboard" do

  before(:each) do
    @user_1 = User.create(username: "default_person_2",
                        password: "password",
                        full_name: "Default Person2",
                        address: "2020 Longest Rd, Denver, CO")
    @user = User.create(username: "default_person_1",
                        password: "password",
                        full_name: "Default Person",
                        address: "2020 Longest Rd, Denver, CO")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "the user can see an Edit Account link" do
    visit dashboard_path

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_link("Edit Account")
  end

  it "the user can edit their own information" do
    visit dashboard_path

    click_link("Edit Account")

    expect(current_path).to eq(edit_user_path(@user))
    fill_in "user[username]", with: "new_name"
    fill_in "user[password]", with: "new_password"
    fill_in "user[full_name]", with: "New Name"
    fill_in "user[address]", with: "1 Market St., Denver, CO"

    click_button "Update User"

    expect(User.last.username).to eq("new_name")
    expect(User.last.full_name).to eq("New Name")
    expect(User.last.address).to eq("1 Market St., Denver, CO")
    expect(current_path).to eq(dashboard_path)
  end

  it "the user cannot edit other user's information" do
    visit edit_user_path(@user_1)

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
