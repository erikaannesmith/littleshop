require 'rails_helper'

describe "When an admin visits 'admin/items/new', enters item information, and clicks Create Item" do
  it "the admin has created a new item" do
    #TODO incorporate category into test and update form and controller (private method)
    visit 'admin/items/new'

    fill_in "item[title]", with: "Item 1"
    fill_in "item[description]", with: "This is an awesome item."
    fill_in "item[price]", with: 100.0
    attach_file "item[image]", '1.jpg'
    click_on "Create Item"

    expect(Item.first.title).to eq("Item 1")
    expect(Item.first.description).to eq("This is an awesome item.")
    expect(Item.first.price).to eq(100.0)
  end
end
