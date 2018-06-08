class GuestsController < ApplicationController
  def preferences
    @guest = Guest.find(params[:id])
    @project = @guest.project
    authorize @guest
    @admin = @project.user.first_name.capitalize
    @week_ends = @guest.project.week_ends
  end

  def update
    @guest = Guest.find(params[:id])
    @project = @guest.project
    authorize @guest
    @guest.update(guest_params)
    redirect_to step2_project_path(@project)
  end

  private

  def guest_params
    params.require(:guest).permit(:budget)
  end
end
