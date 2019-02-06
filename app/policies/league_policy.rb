# frozen_string_literal: true

class LeaguePolicy < ApplicationPolicy
  def permitted_attributes
    %i[day description format gender_restriction level name relegation skill_level]
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
