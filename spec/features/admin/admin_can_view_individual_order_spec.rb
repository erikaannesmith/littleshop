require 'rails_helper'

describe "Admin views an individual order show page" do
  before :each do
    category = create(:category)
    @item = create(:item, 
                   category: category)
    @user = User.create(username: "erika",
                        password: "test", 
                        full_name: "Erika Smith", 
                        address: "1801 Arapahoe St Denver CO 80202")
    @admin = User.create(username: "tym",
                        password: "tym", 
                        full_name: "Tym Joo", 
                        address: "5749 Brookside Lane Washington MI 48094",
                        role: 1)
    @order = Order.create(total_price: @item.price, user_id: @user.id)
    @order_item = @order.order_items.create(item_id: @item.id, historical_price: @item.price, quantity: 1)
    @order_item.update(inline_total: (@order_item.historical_price * @order_item.quantity))
  end
                      
  it "they can see all information associated with that order" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

    visit admin_order_path(@order)

save_and_open_page
    expect(page).to have_content("Erika Smith")
    expect(page).to have_content("1801 Arapahoe St Denver CO 80202")
    expect(page).to have_link(@item.title)
    expect(page).to have_content("Quantity: 1")
    expect(page).to have_content("Item Price: $#{@order_item.historical_price}")
    expect(page).to have_content("Subtotal: $#{@item.price}")
    expect(page).to have_content("Total Price: $#{@item.price}")
    expect(page).to have_content("Status: Ordered")
    
  end
end