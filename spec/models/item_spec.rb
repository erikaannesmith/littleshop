RSpec.context Item do
  describe 'Class Methods' do
    it 'Item created is valid if all attributes are filled out' do
      category = Category.create!(name: "Chinos")
      item = Item.create!(title: "Embroidered Chinos", description: "Business in the front, party in the back!", price: "24.95", category: category.id)

      expect(item).to be_valid
    end

    it "Item created will not be valid and not be saved if title is left out" do
      category = Category.create!(name: "Chinos")
      item = Item.create!(description: "Business in the front, party in the back!", price: "24.95", category: category.id)

      expect(item).to be_invalid
    end

    it "Item created will not be valid and not be saved if there is no associated cateogry" do
      item = Item.create!(description: "Business in the front, party in the back!", price: "24.95", category: category.id)

      expect(item).to be_invalid
    end

    it "Item created will not be valid and not be saved if description is left out" do
      category = Category.create!(name: "Chinos")
      item = Item.create!(title: "Embroidered Chinos", price: "24.95", category: category.id)

      expect(item).to be_invalid
    end

    it "Item created will not be valid and not be saved if price is left out" do
      category = Category.create!(name: "Chinos")
      item = Item.create!(title: "Embroidered Chinos", description: "Business in the front, party in the back!", category: category.id)

      expect(item).to be_invalid
    end



  end
end
