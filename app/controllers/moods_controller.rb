class MoodsController < ApplicationController
  def scenery
    @project = Project.find(params[:project_id])
    @moods = Mood.new
  end

  def lifestyle

  end

  def party

  end

  def create
    @project = Project.find(params[:project_id])
    if params[:wild].present?
      @moods = Mood.new(wild: params[:wild])
    elsif params[:city].present?
      @moods = Mood.new(city: params[:city])
    end
    @moods.project = @project
    @moods.user = current_user
    @moods.save!
  end

  def update
    # @mood = Mood.find(params[:id])
  end
end
