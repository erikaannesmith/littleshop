require 'rails_helper'

describe "visitor goes to items show page" do
  it "they can see the item information" do
    category = create(:category)
    items = create_list(:item, 2, category: category)

    visit items_path

    expect(page).to have_link(items[0].title)
    expect(page).to have_link(items[1].title)

    click_on items[0].title

    expect(current_path).to eq(item_path(items[0]))

    expect(page).to have_content(items[0].title)
    expect(page).to have_content(items[0].description)
    expect(page).to have_content(items[0].price)
    expect(page).to have_css("img[src='#{items[0].image}']")
    expect(page).to have_link(items[0].category.name)
  end

  it "can travel to the category page for that item" do
    category = create(:category)
    items = create_list(:item, 2, category: category)

    visit item_path(items[0])

    click_on items[0].category.name

    expect(current_path).to eq("/#{items[0].category.slug}")
  end

  it "they will see 'Item Retired' instead of a link to add item to cart if the item has been retired" do
    category = create(:category)
    item = create(:item, category: category, status: 1)

    visit item_path(item)

    expect(page).to have_content("Item Retired")
    expect(page).not_to have_link("Add To Cart")
  end
end
