require 'rails_helper'

describe "A visitor can go to the home page, click on a log in, and" do
  it "will load up a new page with form fields and will ask him to log in" do

    visit root_path

    expect(page.status_code).to (200)
    fill_in 'user[username]', with: "CheckOutMahKhakisBabySquirrel"
    fill_in 'user[password]', with: "DiamondStuddedChinos"

    click_on("Log In")
    redirect_to login_path


    expect(page.status_code).to eq(200)

  end
end
