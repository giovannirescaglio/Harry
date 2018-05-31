class MoodsController < ApplicationController
  before_action :set_project, only: [:scenery, :create]

  def scenery
    @mood = Mood.new
  end

  def lifestyle
  end

  def party
  end

  def create
    @mood = Mood.new(mood_params)
    @mood.project = @project
    @mood.user = current_user
    if @mood.save
      redirect_to lifestyle_project_moods_path(@project)
    else
      render :scenery
    end
  end

  def update
    # @mood = Mood.find(params[:id])
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def mood_params
    params.require(:mood).permit(:wild, :city, :fancy, :trashy, :clubbing, :chilling, :project_id, :user_id)
  end
end
