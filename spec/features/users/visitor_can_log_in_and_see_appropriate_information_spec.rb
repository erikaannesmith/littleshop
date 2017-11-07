require 'rails_helper'

describe "When a visitor logs in and is directed to their show page" do

  before(:each) do
    @user = User.create(username: "test_user",
                        password: "password",
                        full_name: "Test User",
                        address: "2020 Market St., Denver, CO"
                      )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit user_path(@user)
  end

  it "they see their account information" do
    expect(page).to have_content("test_user")
    expect(page).to have_content("Test User")
    expect(page).to have_content("2020 Market St., Denver, CO")
  end
end
