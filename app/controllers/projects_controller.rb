class ProjectsController < ApplicationController
  before_action :set_project, only: [:step1, :step2, :ideas, :step3, :votes ]

  def step1
    @guests = @project.guests
    authorize @project
  end

  def step2
    authorize @project
    @guests = @project.guests
    @budgets = @guests.map{ |g| g.budget.to_i}
    @average_budget = @budgets.sum/(@budgets.count)

    @number_of_moods = @project.moods.count
    @number_of_moods_scenery = @project.moods.where("city = TRUE OR wild = TRUE").count

    @moods_city = (@project.moods.where(city: true).count*100) / (@number_of_moods_scenery)
    @moods_wild = (@project.moods.where(wild: true).count*100) / (@number_of_moods_scenery)
    @moods_scenery = @moods_city >= @moods_wild ? "city" : "wild"
    @moods_scenery_percentage = @moods_city >= @moods_wild ? @moods_city : @moods_wild


    @number_of_moods_lifestyle = @project.moods.where("fancy = TRUE OR trashy = TRUE").count

    @moods_fancy = (@project.moods.where(fancy: true).count*100) / (@number_of_moods_lifestyle)
    @moods_trashy = (@project.moods.where(trashy: true).count*100) / (@number_of_moods_lifestyle)
    @moods_lifestyle = @moods_fancy >= @moods_trashy ? "fancy" : "trashy"
    @moods_lifestyle_percentage = @moods_fancy >= @moods_trashy ? @moods_fancy : @moods_trashy

    @number_of_moods_party = @project.moods.where("clubbing = TRUE OR chilling = TRUE").count

    @moods_clubbing = (@project.moods.where(clubbing: true).count*100) / (@number_of_moods_party)
    @moods_chilling = (@project.moods.where(chilling: true).count*100) / (@number_of_moods_party)
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
    redirect_to step1_project_path(@project)
  end

  def ideas
    authorize @project
    @destination = Destination.new
    @activity = Activity.new
  end

  def destroy
  end

  def step3
    authorize @project
    @guests = @project.guests
    @budgets = @guests.map{ |g| g.budget.to_i}
    @average_budget = @budgets.sum/(@budgets.count)

    @number_of_moods = @project.moods.count
    @number_of_moods_scenery = @project.moods.where("city = TRUE OR wild = TRUE").count

    @moods_city = (@project.moods.where(city: true).count*100) / (@number_of_moods_scenery)
    @moods_wild = (@project.moods.where(wild: true).count*100) / (@number_of_moods_scenery)
    @moods_scenery = @moods_city >= @moods_wild ? "city" : "wild"
    @moods_scenery_percentage = @moods_city >= @moods_wild ? @moods_city : @moods_wild


    @number_of_moods_lifestyle = @project.moods.where("fancy = TRUE OR trashy = TRUE").count

    @moods_fancy = (@project.moods.where(fancy: true).count*100) / (@number_of_moods_lifestyle)
    @moods_trashy = (@project.moods.where(trashy: true).count*100) / (@number_of_moods_lifestyle)
    @moods_lifestyle = @moods_fancy >= @moods_trashy ? "fancy" : "trashy"
    @moods_lifestyle_percentage = @moods_fancy >= @moods_trashy ? @moods_fancy : @moods_trashy

    @number_of_moods_party = @project.moods.where("clubbing = TRUE OR chilling = TRUE").count

    @moods_clubbing = (@project.moods.where(clubbing: true).count*100) / (@number_of_moods_party)
    @moods_chilling = (@project.moods.where(chilling: true).count*100) / (@number_of_moods_party)
    @moods_party = @moods_clubbing >= @moods_chilling ? "clubbing" : "chilling"
    @moods_party_percentage = @moods_clubbing >= @moods_chilling ? @moods_clubbing : @moods_chilling
  end

  def votes
    authorize @project
    @day_activities = @project.activities.where(category:"day")
    @night_activities = @project.activities.where(category:"night")
    @destinations = @project.destinations
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
