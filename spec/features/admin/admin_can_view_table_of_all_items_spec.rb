require 'rails_helper'

describe "Admin visits admin items page" do
  before :each do 
    admin = User.create(username: '123', password: "123", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  end
  
  it "they see a link for the items page on the dashboard" do
    visit admin_dashboard_path

    expect(page).to have_link("All Items")

    click_on "All Items"

    expect(current_path).to eq(admin_items_path)
  end

  it "admin can see all items in a table" do
    category = create(:category)
    item = create(:item, category: category)
    
    visit admin_dashboard_path
    click_on "All Items"

    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.status)
    expect(page).to have_link("Edit")
  end

  it "admin can edit item from items table" do
    category = create(:category)
    item = create(:item, category: category)
    
    visit admin_dashboard_path
    click_on "All Items"
    click_on "Edit"

    expect(current_path).to eq(edit_admin_item_path(item))

    fill_in "item[title]", with: "12345"
    
    click_on "Update Item"

    expect(current_path).to eq(admin_items_path)
    expect(page).to have_content("12345")
  end
end