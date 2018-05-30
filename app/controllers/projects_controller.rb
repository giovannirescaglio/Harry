class ProjectsController < ApplicationController
  def step1
    @project = Project.find(params[:id])
    @guests = @project.guests
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.step = 1
    @project.save
    if @project.persisted?
      @guest = Guest.create(user: current_user, project: @project)
    end
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :start_date, :end_date, :max_budget)
  end
end
