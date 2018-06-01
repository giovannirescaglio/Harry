class ProjectsController < ApplicationController
  before_action :set_project, only: [:step1]

  def step1
    @guests = @project.guests
    authorize @project
  end

  def step2
    @project = Project.find(params[:id])
    authorize @project
    @guests = @project.guests
    @budgets = @guests.map{ |g| g.budget}
    @average_budget = @budgets.sum/(@budgets.count)

    @number_of_moods = @project.moods.count
    @moods_city = @project.moods.where(city: true).count.fdiv(@number_of_moods)
    @moods_wild = @project.moods.where(wild: true).count.fdiv(@number_of_moods)
    @moods_scenery = @moods_city >= @moods_wild ? "city" : "wild"
    @moods_scenery_percentage = @moods_city >= @moods_wild ? @moods_city : @moods_wild

    @moods_fancy = @project.moods.where(fancy: true).count.fdiv(@number_of_moods)
    @moods_trashy = @project.moods.where(trashy: true).count.fdiv(@number_of_moods)
    @moods_lifestyle = @moods_fancy >= @moods_trashy ? "fancy" : "trashy"
    @moods_lifestyle_percentage = @moods_fancy >= @moods_trashy ? @moods_fancy : @moods_trashy

    @moods_clubbing = @project.moods.where(clubbing: true).count.fdiv(@number_of_moods)
    @moods_chilling = @project.moods.where(chilling: true).count.fdiv(@number_of_moods)
    @moods_party = @moods_clubbing >= @moods_chilling ? "clubbing" : "chilling"
    @moods_party_percentage = @moods_clubbing >= @moods_chilling ? @moods_clubbing : @moods_chilling
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

  def ideas
    @project = Project.find(params[:id])
    authorize @project
    @destination = Destination.new
    @activity = Activity.new
  end

  def destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :start_date, :end_date, :max_budget)
  end
end


#ENV["DEFAULT_PASSWORD"]
