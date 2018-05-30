class ProjectsController < ApplicationController
  def new
    @project = Project.new()
  end

  def create
    raise
  end

  def destroy
  end
end
