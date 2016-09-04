class DashboardController < ApplicationController
  def index
    @websites = Website.order(:created_at => :desc).limit(5)
    @admins = Admin.order(:site_count => :desc).limit(5)
  end
end
