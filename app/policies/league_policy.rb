# frozen_string_literal: true

class LeaguePolicy < ApplicationPolicy
  def permitted_attributes
    if admin?
      %i[day description format gender_restriction level name relegation skill_level]
    else
      [:name]
    end
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
