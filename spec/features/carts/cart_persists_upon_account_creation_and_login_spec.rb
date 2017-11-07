require 'rails_helper'

describe "When a visitor adds an item to the cart" do
  before :each do
      @category = create(:category)
      @item = create(:item, category: @category)
      @user = User.create(username: "test", password: "test")

      visit items_path

      click_link "Add to Cart"

      expect(page).to have_content("Cart: 1")
  end

  describe "And they log in" do
    it "the cart persists" do
      fill_in "session[username]", with: "test"
      fill_in "session[password]", with: "test"
      click_button "Log In"

      expect(page).to have_content("Cart: 1")
    end
  end

  describe "And they create a new account" do
    it "the cart persists" do
      click_link "Create Account"
      fill_in "user[username]", with: "test-1"
      fill_in "user[password]", with: "test"
      click_button "Create User"
      expect(page).to have_content("Cart: 1")
    end
  end
end
