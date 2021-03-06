require 'rails_helper'

describe 'a visitor can see all items associated with a category' do
  it 'by typing in a vanity url that includes category.name instead of category.id' do
    category = Category.create(name: "Khakis")
    item_1   = Item.create(title: "Diamond Studded Hot Pants", description: "So Hot Right Now", price: 999.95, image: '1.jpg', category: category)

    visit items_path
    click_link "Khakis"

    expect(page).to have_content("Diamond Studded Hot Pants")
    expect(page).to have_content("So Hot Right Now")
  end
end
