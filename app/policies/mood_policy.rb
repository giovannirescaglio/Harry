class MoodPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    true
  end

  def scenery?
    true
  end

  def lifestyle?
    true
  end

  def party?
    true
  end

end
