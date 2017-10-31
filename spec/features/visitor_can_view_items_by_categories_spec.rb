require 'rails_helper'

describe "When a visitor visits '/:CATEGORY_NAME'" do
  it "the visitor sees all items assigned to that category" do

    khakis = Category.create(name: "khakis")
    chinos = Category.create(name: "chinos")
    khaki = create(:item, category: khakis)
    chino = create(:item, category: chinos)

    visit '/khakis'

    expect(page).to have_content(khaki.title)
    expect(page).to have_content(khaki.description)

    expect(page).not_to have_content(chino.price)
    expect(page).not_to have_content(chino.title)
  end
end
