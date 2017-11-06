require 'rails_helper'

describe 'when an admin logs in' do
  before(:each) do
    @category = create(:category)
    @users = create_list(:user, 2)
    @items = create_list(:item, 5, category: @category)
    Order.create(total_price: (@items[0].price * 2), user_id: @users[0].id)
    Order.create(total_price: (@items[1].price * 3), user_id: @users[0].id, status: 1)
    Order.create(total_price: (@items[2].price * 2), user_id: @users[0].id, status: 2)
    Order.create(total_price: (@items[3].price * 2), user_id: @users[1].id, status: 3)
    @admin = User.create(username: '123', password: "123", role: 1)

    visit root_path

    fill_in 'session[username]', with:'123'
    fill_in 'session[password]', with: "123"

    click_on("Log In")
  end

  it "the admin can see the order status of each order" do
    expect(page).to have_content(" - Status: #{Order.first.status}")
    expect(page).to have_content(" - Status: #{Order.second.status}")
    expect(page).to have_content(" - Status: #{Order.third.status}")
    expect(page).to have_content(" - Status: #{Order.fourth.status}")
  end

  it "the admin can click 'Cancel' on orders that are ordered" do
    click_link "Cancel", href: admin_modify_order_path(Order.first, modify_type: "cancel")

    expect(page).to have_content("Order ##{Order.first.id} - Status: Cancelled")
  end

  it "the admin can click 'Cancel' on orders that are paid" do
    click_link "Cancel", href: admin_modify_order_path(Order.second, modify_type: "cancel")

    expect(page).to have_content("Order ##{Order.second.id} - Status: Cancelled")
  end

  it "the admin can click 'Mark As Paid' on orders that are ordered" do
    click_link "Mark As Paid", href: admin_modify_order_path(Order.first, modify_type: "mark as paid")

    expect(page).to have_content("Order ##{Order.first.id} - Status: Paid")
  end

  it "the admin can click 'Mark As Completed' on orders that are paid" do
    click_link "Mark As Completed", href: admin_modify_order_path(Order.second, modify_type: "mark as completed")

    expect(page).to have_content("Order ##{Order.second.id} - Status: Completed")
  end

  it "the admin should not see links for completed and cancelled orders" do
    expect(page).not_to have_link(href: admin_modify_order_path(Order.third, modify_type: "cancel"))
    expect(page).not_to have_link(href: admin_modify_order_path(Order.fourth, modify_type: "cancel"))

    expect(page).not_to have_link(href: admin_modify_order_path(Order.third, modify_type: "mark as paid"))
    expect(page).not_to have_link(href: admin_modify_order_path(Order.fourth, modify_type: "mark as paid"))

    expect(page).not_to have_link(href: admin_modify_order_path(Order.third, modify_type: "mark as completed"))
    expect(page).not_to have_link(href: admin_modify_order_path(Order.fourth, modify_type: "mark as completed"))
  end
end
