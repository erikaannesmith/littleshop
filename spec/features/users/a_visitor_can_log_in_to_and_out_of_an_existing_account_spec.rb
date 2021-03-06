require 'rails_helper'

describe "A visitor can go to the home page, click on a log in, and" do
  it "will load up a new page with form fields and will ask him to log in" do
    user = User.create(username:"CheckOutMahKhakisBabySquirrel", password:"DiamondStuddedChinos" )

    visit root_path

    expect(page.status_code).to eq(200)
    fill_in 'session[username]', with: "CheckOutMahKhakisBabySquirrel"
    fill_in 'session[password]', with: "DiamondStuddedChinos"

    click_on("Log In")
    expect(current_path).to eq("/dashboard")

    expect(page.status_code).to eq(200)
  end

  it "will have a log out page that will redirect back to root index" do
    user = User.create(username:"CheckOutMahKhakisBabySquirrel", 
                       password:"DiamondStuddedChinos",
                       full_name: "Tym Joo",
                       address: "1801 Arapahoe St Denver CO 80202" )

    visit root_path

    expect(page.status_code).to eq(200)
    fill_in 'session[username]', with: "CheckOutMahKhakisBabySquirrel"
    fill_in 'session[password]', with: "DiamondStuddedChinos"

    click_on("Log In")
    expect(current_path).to eq("/dashboard")

    expect(page.status_code).to eq(200)

    click_on("Log Out")
    expect(current_path).to eq(root_path)
  end
end
