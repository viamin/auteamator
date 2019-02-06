# frozen_string_literal: true

class FootballAssociationPolicy < ApplicationPolicy
  def permitted_attributes
    [:name, clubs_attributes: [:name], leagues_attributes: %i[day description format gender_restriction level name relegation skill_level]]
  end

  def show?
    true
  end

  # Anyone can create a new association
  def new?
    true
  end

  def create?
    true
  end

  # Anyone can update an association
  def update?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
