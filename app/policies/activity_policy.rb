class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def upvote?
    true
  end

  def new?
    true
  end

  def edit?
    true
  end

  def show?
    true
  end

end
