# frozen_string_literal: true

class TeamPolicy < ApplicationPolicy
  def permitted_attributes
    if admin?
      %i[name url]
    else
      []
    end
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
