class WeekendsController < ApplicationController
  def upvote
    @weekend = WeekEnd.find(params[:id])
    @project = @weekend.project
    authorize @weekend
    @guest = current_user.guests.find_by(project_id: @project)
    @weekend.upvote_by @guest
    redirect_to preferences_guest_path(@guest)
  end
end
