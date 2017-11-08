require 'rails_helper'

describe 'an authenticated user cannot view' do
  before :each do
    @user = User.create(username: "123", password: "123", role: 0)
    @user_2 = User.create(username: "345", password: "234", role: 0)
    @khakis = Category.create(name: "khakis")
    @chinos = Category.create(name: "chinos")


    visit root_path
  end
  it 'cant view another users private data' do
    fill_in 'session[username]', with: "123"
    fill_in 'session[password]', with: "123"

    click_on("Log In")

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content(@user.username)
    expect(page).not_to have_content(@user_2.username)

  end
  it 'also cannot view administrator screens' do
    fill_in 'session[username]', with: "123"
    fill_in 'session[password]', with: "123"

    click_on("Log In")

    visit new_admin_item_path

    expect(page).to have_content("The page you were looking for doesn't exist. You may have mistyped the address or the page may have moved. If you are the application owner check the logs for more information.")
  end

  it 'also cannot use admin functionality and the user cant make themselves an admin' do
    visit signup_path

    expect(page).not_to have_content("Role")
  end
end
