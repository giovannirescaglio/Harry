class GuestsController < ApplicationController
def preferences
  @guest = Guest.find(params[:id])
  @admin = current_user.guests.find_by(role: 'admin')
end

def update
  @guest = Guest.find(params[:id])
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
