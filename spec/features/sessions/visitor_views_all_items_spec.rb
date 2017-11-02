require 'rails_helper'

describe "When a visitor views the items index page" do
    it "they see all items" do
        category = create(:category)
        items = create_list(:item, 2, category: category)

        visit items_path
        # save_and_open_page

        expect(page).to have_content(items[0].title)
        expect(page).to have_content(items[0].description)
        expect(page).to have_content(items[0].price)
        expect(page).to have_css("img[src='#{items[0].image}']")
        expect(page).to have_content(items[1].title)
        expect(page).to have_content(items[1].description)
        expect(page).to have_content(items[1].price)
        expect(page).to have_css("img[src='#{items[1].image}']")
    end
end
