# frozen_string_literal: true

# == Schema Information
#
# Table name: football_associations
#
#  id         :bigint(8)        not null, primary key
#  name       :string
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
end
