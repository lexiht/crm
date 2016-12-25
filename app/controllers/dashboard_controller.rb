class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @workshops = current_user.business.workshops
  end
end
