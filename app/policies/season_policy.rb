# frozen_string_literal: true

class SeasonPolicy < ApplicationPolicy
  def permitted_attributes
    if admin?
      %i[title starts ends url]
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
