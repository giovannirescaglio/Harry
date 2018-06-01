class MoodsController < ApplicationController
  before_action :set_project, only: [:scenery, :lifestyle, :party, :create]
  before_action :set_mood, only: [:lifestyle, :party, :update]

  def scenery
    @mood = Mood.new
    authorize @mood
  end

  def lifestyle
    authorize @mood
  end

  def party
    authorize @mood
  end

  def create
    @mood = Mood.new(mood_params)
    authorize @mood
    @mood.project = @project
    @mood.user = current_user
    if @mood.save
      redirect_to lifestyle_project_moods_path(@project)
    else
      render :scenery
    end
  end

  def update
    authorize @mood
    mood_step = params[:mood][:step]
    next_step = Mood::TRANSITIONS[mood_step]
    if next_step.nil?
      guest = current_user.guests.find_by(project_id: @project)
      url = preferences_guest_path(guest)
    else
      url = polymorphic_url([next_step.to_sym, @project, Mood])
    end
    if @mood.update(mood_params)
      redirect_to url
    else
      render mood_step.to_sym
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_mood
    set_project
    @mood = @project.moods.where(user_id: current_user).last
  end

  def mood_params
    params.require(:mood).permit(:wild, :city, :fancy, :trashy, :clubbing, :chilling, :project_id, :user_id)
  end
end
