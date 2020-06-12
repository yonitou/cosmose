class CollaborationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.project.user != user
  end

  def show?
    true
  end

  def accept?
  record.project.user == user
  end

  def decline?
   record.project.user == user
  end

  def destroy?
    record.project.user == user
  end
end
