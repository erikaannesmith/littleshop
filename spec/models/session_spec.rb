require 'rails_helper'

RSpec.describe "Session Model Test" do
  context "for create account validation if it" do
    it 'proves valid if username and password is there' do
      user = User.create(username: "KhakiLover101", password: "They're CHINOS!")

      expect(user).to be_valid
    end

    it 'proves invalid if only username is provided' do
      user = User.create(username: "THEYRE CHINOS DAMMIT!")

      expect(user).to be_invalid
    end

    it 'is invalid if only password is provided' do
      user = User.create(password: "123")

      expect(user).to be_invalid
    end

  end
end
