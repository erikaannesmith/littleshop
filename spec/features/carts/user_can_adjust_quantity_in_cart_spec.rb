require "rails_helper"

describe "When a user visits the cart" do
  it "the user can increase the quantity of an item" do
    category = create(:category)
    items = create_list(:item, 2, category: category)

    visit items_path

    # find('.button_to', match: :first).click
    # click_button "Add to Cart", action: "/carts?item_id=5"
    first(".button_to").click
    expect(page).to have_content("Cart: 1")
    click_on "View Cart"

    expect(page).to have_content("Quantity: 1")
  end
end
