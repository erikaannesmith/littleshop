require 'rails_helper'

describe "When a visitor logs in and is directed to their show page" do

  before(:each) do
    @other_user = User.create(username: "other_test_user",
                        password: "password",
                        full_name: "Other User",
                        address: "2020 Market St., Denver, CO"
                      )
    @user = User.create(username: "test_user",
                        password: "password",
                        full_name: "Test User",
                        address: "2020 Market St., Denver, CO"
                      )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit dashboard_path
  end

  it "they see their account information" do
    expect(page).to have_content("test_user")
    expect(page).to have_content("Test User")
    expect(page).to have_content("2020 Market St., Denver, CO")
  end

  it "they can see a link to their orders" do
    expect(page).to have_link("All Orders")
  end

  it "they cannot see another users show page" do
    visit dashboard_path

    expect(page).not_to have_content("other_test_user")
  end
end
