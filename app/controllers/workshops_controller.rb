class WorkshopsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workshop, only: [:show, :destroy, :edit, :update]

  def new
    @workshop = current_user.business.workshops.new
  end

  def create
    @workshop = current_user.business.workshops.create(workshop_params)
    redirect_to dashboard_path
  end

  def show
  end

  def edit
    session[:redirect_to] = request.referer
  end

  def update
    @workshop.update(workshop_params)
    redirect_to session.delete(:redirect_to)
  end

  def destroy
    @workshop.delete
    redirect_to dashboard_path
  end

  private

    def workshop_params
      params.require(:workshop).permit(:name, :description, :capacity, :status)
    end

    def set_workshop
      @workshop = Workshop.find(params[:id])
    end

end
