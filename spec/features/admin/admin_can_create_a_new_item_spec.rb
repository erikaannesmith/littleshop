require 'rails_helper'

describe "When an admin visits dashboard, clicks Create Item, enters item information, and clicks Create Item" do
  it "the admin has created a new item" do
    category = create(:category)
    admin = User.create(username: "admin", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    click_link "Create Item"

    fill_in "item[title]", with: "Item 1"
    fill_in "item[description]", with: "This is an awesome item."
    fill_in "item[price]", with: 100.0
    attach_file "item[image]", 'app/assets/images/1.jpg'
    select category.name, from: 'item[category_id]'
    click_on "Create Item"

    expect(Item.first.title).to eq("Item 1")
    expect(Item.first.description).to eq("This is an awesome item.")
    expect(Item.first.price).to eq(100.0)
    expect(Item.first.category).to eq(category)
  end
end
