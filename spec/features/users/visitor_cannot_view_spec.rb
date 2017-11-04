require 'rails_helper'

describe 'an visitor cannot view' do

  it 'users private data' do

    visit dashboard_path
    expect(page).to have_content("The page you were looking for doesn't exist. You may have mistyped the address or the page may have moved. If you are the application owner check the logs for more information.")
  end

  it 'admin screens' do
    visit new_admin_item_path

    expect(page).to have_content("The page you were looking for doesn't exist. You may have mistyped the address or the page may have moved. If you are the application owner check the logs for more information.")
  end
end
