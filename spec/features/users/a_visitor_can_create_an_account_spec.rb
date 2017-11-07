require 'rails_helper'

describe "A visitor can go to the home page and it" do
  it "will load up a new page with form fields and will ask him to create An Account" do

    visit root_path

    expect(page.status_code).to eq(200)

    click_on("Create Account")

    expect(current_path).to eq("/signup")

    fill_in 'user[username]', with: "CheckOutMahKhakisBabySquirrel"
    fill_in 'user[password]', with: "DiamondStuddedChinos"
    fill_in 'user[full_name]', with: "Tym Joo"
    fill_in 'user[address]', with: "1801 Arapahoe St Denver CO 80202"


    click_button("Create User")

    expect(current_path).to eq("/dashboard")

    expect(page.status_code).to eq(200)

  end
end
