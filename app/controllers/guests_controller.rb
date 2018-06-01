class GuestsController < ApplicationController
def preferences
  @guest = Guest.find(params[:id])
  authorize @guest
  @admin = @guest.user.first_name.capitalize
  @week_ends = @guest.project.week_ends
end

def update
  @guest = Guest.find(params[:id])
  authorize @guest
  if @guest.update(guest_params)
    redirect_to step2_project_path
  else
    render :preferences
  end
end

private

  def guest_params
      params.require(:guest).permit(:budget)
  end
end
