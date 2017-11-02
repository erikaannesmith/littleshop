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

        expect(page).to have_content("Cart: 1")
        expect(page).to have_content("Successfully removed #{item.title} from your cart.")

        within('.notice') do
            expect(page).to have_link("#{item.title}")
            
            click_on "#{item.title}"

            expect(current_path).to eq(item_path(item))
        end

        click_on "View Cart"

        click_on "Remove"

        expect(page).to have_content("Cart: 0")
        expect(page).not_to have_content("Item: #{item.title}")
    end
end