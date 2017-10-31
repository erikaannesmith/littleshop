require 'rails_helper'

RSpec.feature "When a user adds an item to their cart" do
    before :each do
        @item = create(:item)
    end

    it "a message is displayed" do
        visit items_path

        click_button "Add to Cart"

        expect(page).to have_content("You now have 1 #{@item.title} in your cart.")
    end

    it "the message correctly increments for multiple items" do
        visit items_path

        click_button "Add to Cart"

        expect(page).to have_content("You now have 1 #{@item.title} in your cart.")

        click_button "Add to Cart"

        expect(page).to have_content("You now have 2 #{@item.title}s in your cart.")
    end

    it "total number of items increments" do
        visit items_path

        expect(page).to have_content("Cart: 0")

        click_button "Add to Cart"

        expect(page).to have_content("Cart: 1")
    end
end