class DestinationsController < ApplicationController

def upvote
    @destination = Destination.find(params[:id])
    @project = @destination.project
    authorize @destination
    @destination.upvote_by current_user
    respond_to do |format|
      format.html { redirect_to votes_project_path(@project)}
      format.js
    end

  end
end

