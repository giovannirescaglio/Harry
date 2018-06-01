class GuestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def preferences?
    true
  end

  def update?
    true
  end

end
