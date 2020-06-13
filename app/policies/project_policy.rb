class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    true
  end

  def show?
    true
  end

  def update?
    !user.visitor?(record)
  end

  def destroy?
    user.owner?(record)
  end
  end
