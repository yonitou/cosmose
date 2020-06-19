class BlockPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    true
  end

  def destroy?
    record.user == user || !user.visitor?(Project.find(record.project_id)) if record.project_id
  end
  end
