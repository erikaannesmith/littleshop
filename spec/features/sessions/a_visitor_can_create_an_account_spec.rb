require 'rails_helper'

describe "A visitor can go to the home page, click on a create Account, and" do
  it "will load up a new page with form fields and will ask him to create An Account" do

    visit root_path

    expect(page.status_code).to (200)
    click_on("Create Account")
    redirect_to signup_path
    fill_in 'user[username]', with: "CheckOutMahKhakisBabySquirrel"
    fill_in 'user[password]', with: "DiamondStuddedChinos"

    click_on("Create My Account")
    redirect_to users_path 

    expect(page.status_code).to eq(200)

  end
end
