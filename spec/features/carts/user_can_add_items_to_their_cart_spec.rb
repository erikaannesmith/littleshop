require 'rails_helper'

RSpec.feature "When a user adds an item to their cart" do
    before :each do
        @category = create(:category)
        @item = create(:item, category: @category)
    end

    it "a message is displayed" do
        visit items_path

        click_on "Add to Cart"

        expect(page).to have_content("You now have 1 #{@item.title} in your cart.")
    end

    it "the message correctly increments for multiple items" do
        visit items_path

        click_on "Add to Cart"

        expect(page).to have_content("You now have 1 #{@item.title} in your cart.")

        click_on "Add to Cart"

        expect(page).to have_content("You now have 2 #{@item.title}s in your cart.")
    end

    it "total number of items increments" do
        visit items_path

        expect(page).to have_content("Cart: 0")

        click_on "Add to Cart"

        expect(page).to have_content("Cart: 1")
    end

    it "can view the cart" do
        visit items_path

        click_on "Add to Cart"

        click_on "Add to Cart"

        click_link "View Cart"

        expect(current_path).to eq("/cart")

        expect(page).to have_content("#{@item.title}")
        expect(page).to have_content("#{@item.description}")
        expect(page).to have_content("#{@item.price}")
        expect(page).to have_content("Total Price of Cart: $#{@item.price * 2}")
    end

    it "user can checkout" do
        user = User.create(username: "Erika", password: "Erika")
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit items_path

        click_on "Add to Cart"

        click_on "View Cart"

        expect(page).to have_link("Checkout")

        click_link "Checkout"

        expect(user.orders.last.total_price).to eq(@item.price)
        expect(current_path).to eq(orders_path)
    end
end
