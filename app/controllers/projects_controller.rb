class ProjectsController < ApplicationController
  before_action :set_project, only: [:step1]

  def step1
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
      @guest = Guest.create(user: current_user, project: @project, role:"admin")
      params[:emails].each do |email|
        @newuser = User.create(email: email, password: ENV["DEFAULT_PASSWORD"])
        @newguest = Guest.create(user: @newuser, project: @project, role:"participant")
      end
    end
  end

  def destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :start_date, :end_date, :max_budget)
  end
end


#ENV["DEFAULT_PASSWORD"]
