class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def ideas?
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

  def scenery?
    step1?
  end

  def step2?
    true
  end

  def lifestyle?
    step2?
  end

  def step3?
    true
  end

  def party?
    step3?
  end

  def votes?
    true
  end

  def results?
    true
  end

   def update?
    true
  end
end
