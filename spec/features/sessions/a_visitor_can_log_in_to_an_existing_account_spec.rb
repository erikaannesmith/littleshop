require 'rails_helper'

describe "A visitor can go to the home page, click on a log in, and" do
  it "will load up a new page with form fields and will ask him to log in" do

    visit root_path

    expect(page.status_code).to eq(200)
    fill_in 'session[username]', with: "CheckOutMahKhakisBabySquirrel"
    fill_in 'session[password]', with: "DiamondStuddedChinos"

    click_on("Log In")
    expect(current_path).to eq(login_path)

    expect(page.status_code).to eq(200)

  end
end
