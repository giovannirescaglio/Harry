class ProjectsController < ApplicationController
  def step1
    @project = Project.find(params[:id])
    @guests = @project.guests
  end

  def find_weekends(start_date, end_date)
    week_ends = []
    if start_date.wday > 5
      first_friday = start_date + (5 + (7 - start_date.wday))
    else
      first_friday = start_date + (5 - start_date.wday)
    end
    first_sunday = first_friday + 2
    week_ends << {start_date: first_friday, end_date: first_sunday}
    next_sunday = first_sunday + 7
    next_friday = first_friday + 7
    while next_sunday <= end_date do
      week_ends << {start_date: next_friday, end_date: next_sunday}
      next_sunday += 7
      next_friday += 7
    end
    week_ends
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    @project.user = current_user
    @project.step = 1
    @project.save
    if @project.persisted?
      @guest = Guest.create(user: current_user, project: @project, role:"admin")
      params[:emails].each do |email|
        @newuser = User.create(email: email, password: ENV["DEFAULT_PASSWORD"])
        @newguest = Guest.create(user: @newuser, project: @project, role:"participant")
      end
      find_weekends(@project.start_date, @project.end_date).each do |weekend|
        @weekend = WeekEnd.new(weekend)
        @weekend.project = @project
        @weekend.save
      end
    end
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :start_date, :end_date, :max_budget)
  end
end


#ENV["DEFAULT_PASSWORD"]
