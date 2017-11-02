require "rails_helper"

describe "When a user visits the cart" do
  it "the user can increase the quantity of an item" do
    category = create(:category)
    items = create_list(:item, 2, category: category)

    visit items_path

    click_link "Add to Cart", href: "/carts?item_id=#{items[0].id}"
    click_link "Add to Cart", href: "/carts?item_id=#{items[0].id}"
    click_link "Add to Cart", href: "/carts?item_id=#{items[1].id}"

    click_on "View Cart"

    expect(page).to have_content("Quantity: 2")
    expect(page).to have_content("Quantity: 1")

    click_link "+", href: "/cart_add?item_id=#{items[0].id}"

    expect(page).to have_content("Quantity: 3")
    expect(page).to have_content("Subtotal: $#{items[0].price * 3}")
  end

  it "the user can decrease the quantity of an item" do
    category = create(:category)
    items = create_list(:item, 2, category: category)

    visit items_path

    click_link "Add to Cart", href: "/carts?item_id=#{items[0].id}"
    click_link "Add to Cart", href: "/carts?item_id=#{items[0].id}"

    click_on "View Cart"

    click_link "-", href: "/cart_sub?item_id=#{items[0].id}"

    expect(page).to have_content("Quantity: 1")
  end
end
