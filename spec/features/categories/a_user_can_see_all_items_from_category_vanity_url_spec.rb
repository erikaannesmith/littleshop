require 'rails_helper'

describe 'a visitor can see all items associated with a category' do
  it 'by typing in a vanity url that includes category.name instead of category.id' do
    visit '/khakis'

    expect(page).to have_content("Item List")
  end
end
