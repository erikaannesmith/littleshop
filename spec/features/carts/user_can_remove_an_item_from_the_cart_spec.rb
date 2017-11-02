require 'rails_helper'

describe "User visits the cart" do
    it "they can remove an item" do
        category = create(:category)
        item = create(:item, category: category)

        visit items_path

        click_on "Add to Cart"
        click_on "Add to Cart"

        click_on "View Cart"

        expect(page).to have_content("Cart: 2")

        click_on "Remove"

        expect(page).to have_content("Cart: 0")
        expect(page).to have_content("Successfully removed #{item.title} from your cart.")
        expect(page).not_to have_content("Item: #{item.title}")
        expect(page).to have_content("Total Price of Cart: $0")
        expect(page).to have_link(item.title)

        click_link item.title

        expect(current_path).to eq(item_path(item))

    end
end
