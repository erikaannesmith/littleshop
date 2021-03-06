require 'rails_helper'

describe "When a visitor views the items index page" do
  it "they see all items" do
    category = create(:category)
    items = create_list(:item, 2, category: category)

    visit items_path

    expect(page).to have_link("#{category.name}")
    expect(page).to have_link(items[0].title)
    expect(page).to have_content(items[0].description)
    expect(page).to have_content(items[0].price)
    expect(page).to have_css("img[src='#{items[0].image}']")
    expect(page).to have_link(items[1].title)
    expect(page).to have_content(items[1].description)
    expect(page).to have_content(items[1].price)
    expect(page).to have_css("img[src='#{items[1].image}']")
  end

  it "they see a retired item which won't have a link to add to cart" do
    category = create(:category)
    item = create(:item, category: category, status: 1)

    visit items_path

    expect(page).to have_content("Item Retired")
    expect(page).not_to have_link("Add To Cart")
  end
end
