require 'rails_helper'

RSpec.context Item do
  before :each do
    @category = create(:category)
  end

  describe "Validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        item = Item.create(description: "Business in the front, party in the back!",
                            price: "24.95",
                            category: @category)

        expect(item).to be_invalid
      end

      it "is invalid without a description" do
        item = Item.create(title: "Chino",
                            price: "24.95",
                            category: @category)

        expect(item).to be_invalid
      end

      it "is invalid without a price" do
        item = Item.create(title: "Chino",
                            description: "Business in the front, party in the back!",
                            category: @category)

        expect(item).to be_invalid
      end

      it "is invalid without a category" do
        item = Item.create(title: "Chino",
                            description: "Business in the front, party in the back!",
                            price: "24.95",
                            image: "http://vignette1.wikia.nocookie.net/logopedia/images/a/a4/Google-Currents-Featured-300x300.png/revision/latest?cb=20120704191200")

        expect(item).to be_invalid
      end
    end

    context "valid attributes" do
      it 'is valid with title, description, price, image, and category' do
        item = Item.create(title: "Chino",
                            description: "Business in the front, party in the back!",
                            price: "24.95",
                            category: @category)

        expect(item).to be_valid
      end
    end
  end

  describe "Relationships" do
    it 'belongs to category' do
      item = Item.create(title: "Chino",
                              description: "Business in the front, party in the back!",
                              price: "24.95",
                              category: @category)

      expect(item).to respond_to(:category)
    end
  end
end
