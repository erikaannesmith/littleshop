require 'rails_helper'

describe 'when an admin logs in' do
  before(:each) do
    @category = create(:category)
    @users = create_list(:user, 2)
    @items = create_list(:item, 5, category: @category)
    Order.create(total_price: (@items[0].price * 2), user_id: @users[0].id)
    Order.create(total_price: (@items[1].price * 3), user_id: @users[0].id)
    Order.create(total_price: (@items[2].price * 2), user_id: @users[0].id)
    Order.create(total_price: (@items[3].price * 2), user_id: @users[1].id)
    Order.create(total_price: (@items[4].price * 2), user_id: @users[1].id)
    @admin = User.create(username: '123', password: "123", role: 1)

    visit root_path

    fill_in 'session[username]', with:'123'
    fill_in 'session[password]', with: "123"

    click_on("Log In")
  end

  it 'is redirected to admin dashboard' do
    expect(current_path).to eq(admin_dashboard_path)
  end

 it "the admin sees a listing of all orders" do
    expect(page).to have_link("Order ##{Order.first.id}")
    expect(page).to have_link("Order ##{Order.second.id}")
    expect(page).to have_link("Order ##{Order.third.id}")
    expect(page).to have_link("Order ##{Order.fourth.id}")
    expect(page).to have_link("Order ##{Order.fifth.id}")
  end
end
