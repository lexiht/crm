class ProjectsController < ApplicationController

  def new
    @workshop = Workshop.find(params[:workshop_id])
    @project = @workshop.projects.new
  end

end
