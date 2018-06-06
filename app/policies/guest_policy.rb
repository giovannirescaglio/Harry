class GuestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def preferences?
    record.user == user
  end

  def update?
    true
  end

  def create?
    true
  end

end
