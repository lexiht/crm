class ProjectsController < ApplicationController
  before_action :set_workshop, except: [:show, :edit, :update]
  before_action :set_project

  def new
    @project = @workshop.projects.new
  end

  def create
    @project = @workshop.projects.create(project_params)
    redirect_to workshop_path(@workshop)
  end

  def show

  end

  def edit
    session[:redirect_to] = request.referer
  end

  def update
    @project.update(project_params)
    redirect_to session.delete(:redirect_to)
  end

  def destroy
    @project.delete
    redirect_to workshop_path(@workshop)
  end

  private

  def set_workshop
    @workshop = Workshop.find(params[:workshop_id])
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :reference, :due_date)
  end
end
