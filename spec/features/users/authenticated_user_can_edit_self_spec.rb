require 'rails_helper'

describe "When an authenticated user visits their dashboard" do

  before(:each) do
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
  end
end
