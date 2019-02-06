# frozen_string_literal: true

class ClubPolicy < ApplicationPolicy
  def permitted_attributes
    if admin? || club_admin?
      [:name]
    else
      []
    end
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def club_admin?
    user.has_role? :admin, :scope
  end
end
