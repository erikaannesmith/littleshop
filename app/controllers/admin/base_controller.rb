class Admin::BaseController < ApplicationController
  before_action :current_admin

  def current_admin
    render_404 unless current_admin?
  end
end
