class WorkshopsController < ApplicationController
  before_action :authenticate_user!

  def new
    @workshop = current_user.business.workshops.new
  end

  def create
    @workshop = current_user.business.workshops.create(workshop_params)
    redirect_to dashboard_path
  end

  private

    def workshop_params
      params.require(:workshop).permit(:name, :description, :capacity, :status)
    end

end
