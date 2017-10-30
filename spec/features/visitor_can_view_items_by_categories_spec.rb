require 'rails_helper'

describe "When a visitor visits '/:CATEGORY_NAME'" do
  it "the visitor sees all items assigned to that category" do
    khakis = create_list(:item, 2, category: 0)
    chino = create(:item, category: 1)

    visit '/khakis'

    expect(page).to have_content(khakis[0].title)
    expect(page).to have_content(khakis[1].title)
    expect(page).to have_content(khakis[0].price)
    expect(page).to have_content(khakis[1].price)
    
    expect(page).not_to have_content(chino.price)
    expect(page).not_to have_content(chino.title)
  end
end
