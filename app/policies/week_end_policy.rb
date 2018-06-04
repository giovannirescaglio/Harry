class WeekEndPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def upvote?
    true
  end
end
