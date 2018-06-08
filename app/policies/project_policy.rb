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
    user.guests.any? do |guest|
      record.guests.include? guest
    end
  end

  def scenery?
    step1?
  end

  def step2?
    step1?
  end

  def lifestyle?
    step2?
  end

  def step3?
    step2?
  end

  def party?
    step3?
  end

  def votes?
    step3?
  end

  def results?
    votes?
  end

  def waiting?
    true
  end

   def update?
    true
  end
end
