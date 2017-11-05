require 'rails_helper'

describe 'when an admin logs in and visits admin dashboard' do
    it 'sees a heading on the page that says admin dashboard' do
      admin = User.create(username: '123', password: "123", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      expect(page).to have_content("Admin Dashboard")

    end

    scenario 'when a registered user tries to access admin dashboard they get a 404' do
      user = User.create(username: "tyJ", password: "123", role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist. You may have mistyped the address or the page may have moved. If you are the application owner check the logs for more information.")
    end

    scenario 'when a visitor tries to access admin dashboard they get a 404' do
      visit admin_dashboard_path

      expect(page).to have_content("The page you were looking for doesn't exist. You may have mistyped the address or the page may have moved. If you are the application owner check the logs for more information.")
    end
end
