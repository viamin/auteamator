# frozen_string_literal: true

class ClubPolicy < ApplicationPolicy
  def permitted_attributes
    [:name]
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
