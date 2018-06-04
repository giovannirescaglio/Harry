class ActivitiesController < ApplicationController

  def create
    @activity = Activity.new
    authorize @activity
    @destination = Destination.new
    if activities_params[:category] == "Day Activity"
      @activity = Activity.create(name: activities_params[:name], category: "Day", project_id: params[:project].to_i)
    elsif activities_params[:category] == "Night Activity"
      @activity = Activity.create(name: activities_params[:name], category: "Night", project_id: params[:project].to_i)
    elsif activities_params[:category] == "Destination"
      @destination = Destination.create(name: activities_params[:name], project_id: params[:project].to_i)
    end
    redirect_to ideas_project_path(Project.find(params[:project].to_i))

  end

  def upvote
    @activity = Activity.find(params[:id])
    @project = @activity.project
    authorize @activity
    @activity.upvote_by current_user
    redirect_to votes_project_path(@project)
  end

  # def downvote
  #   @activity = Activity.find(params[:id])
  #   @activity.downvote_by current_user
  #   redirect_to :back
  # end

private

  def activities_params
    params.require(:activity).permit(:name, :category)
  end
end
