require 'rails_helper'

describe "Once an order is placed" do

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
    @order = @user.orders.create(total_price: 1.0)
  end

  it "a user can view their own orders" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit user_order_path(@user, @order)

    expect(current_path).to eq(user_order_path(@user,@order))
  end

  it "a user cannot view another user's order" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@other_user)

    visit user_order_path(@user, @order)

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

end
