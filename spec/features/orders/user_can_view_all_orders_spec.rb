require 'rails_helper'

describe "User checks out a cart" do
  before :each do
    category = create(:category)
    @item = create(:item, category: category)
    @user = User.create(username: "erika", password: "test")
    @user2 = User.create(username: "adrian", password: "test2")
  end
  
  it "and it will create an order associated with that user" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit items_path

    click_on "Add to Cart"

    expect(page).to have_content("Cart: 1")

    click_on "View Cart"

    expect(page).to have_content("Checkout")

    click_on "Checkout"

    expect(current_path).to eq('/orders')
    expect(page).to have_content("All Orders for #{@user.username}")

    expect(page).to have_content("##{Order.last.id}")
  end

  it "user can view order show page" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit items_path

    click_on "Add to Cart"

    expect(page).to have_content("Cart: 1")

    click_on "View Cart"

    expect(page).to have_content("Checkout")

    click_on "Checkout"

    expect(page).to have_content("Cart: 0")

    click_on "##{Order.last.id}"

    expect(current_path).to eq(user_order_path(@user, Order.last))
    expect(page).to have_content("Quantity: 1")
    expect(page).to have_content("Subtotal: $#{@item.price}")
    expect(page).to have_content("Status: Ordered")
    expect(page).to have_content("Total Price: $#{@item.price}")

    click_on @item.title

    expect(current_path).to eq(item_path(@item))
    expect(page).not_to have_content("Order Updated @")
  end

  it "user can only see their own orders" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit items_path

    click_on "Add to Cart"

    click_on "View Cart"

    click_on "Checkout"

    expect(current_path).to eq('/orders')
    expect(page).to have_content("##{Order.last.id}")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user2)

    visit "/orders"

    expect(page).not_to have_content("Order ##{Order.last.id}")  
  end
end