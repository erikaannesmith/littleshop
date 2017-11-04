require 'rails_helper'

describe "authenticated user visits account page" do
  before :each do 
    @user = User.create(username: "xyz",
                        password: "xyz")
  end

  it "they see a link to view orders index" do
    visit "/"

    expect(page).to have_link("All Orders")

    click_on "All Orders"

    expect(current_path).to eq(user_orders_path(@user))
  end
end