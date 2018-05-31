class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def new?
    true
  end

  def destroy?
    true
  end

  def step1?
    true
  end

  def step2?
    true
  end

  def step3?
    true
  end

  def votes?
    true
  end

  def results?
    true
  end
end
