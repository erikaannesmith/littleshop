require 'rails_helper'

describe 'when an admin logs in' do
  it 'is redirected to admin dashboard' do
    admin = User.create(username: '123', password: "123", role: 1)

    visit root_path

    fill_in 'session[username]', with:'123'
    fill_in 'session[password]', with: "123"

    click_on("Log In")

    expect(current_path).to eq(admin_dashboard_path)

  end
end
