class Admin::BaseController < ApplicationController
  before_action :current_admin

  def current_admin
    not_found unless current_admin?
  end
end
