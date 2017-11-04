require 'rails_helper'

describe 'when an admin logs in and visits admin dashboard' do
    it 'sees a heading on the page that says admin dashboard' do
      admin = User.create(username: '123', password: "123", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      expect(page).to have_content("Admin Dashboard")

    end
end
