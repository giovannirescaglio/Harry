class ProjectsController < ApplicationController
  def step1
    @project = Project.find(params[:id])
    @guests = @project.guests
  end
end
