# frozen_string_literal: true

# == Schema Information
#
# Table name: football_associations
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# The top level container for everything (except maybe a confederation, which is
# not currently in the scope of Auteamator)
# Allows a user to track teams/games in multiple organizations
# For example, if I play on teams in Sports4Good and also IPlayFor,
# those are the associations
class FootballAssociation < ApplicationRecord
  has_many :clubs, dependent: :nullify
  has_many :leagues, dependent: :nullify
  accepts_nested_attributes_for :clubs, allow_destroy: true
  accepts_nested_attributes_for :leagues, allow_destroy: true

  validates :name, uniqueness: true

  # imports leagues, seasons, teams, players, etc. found at the base URL for the FA
  # picks a strategy based on the domain (and hopes one of a select group of
  # domains is in use.)
  def import_all!
    # The recipe:
    # download the root url and search for a matching strategy
    # root_page = HTTParty.get(url)
  end
end
