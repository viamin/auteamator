# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  club_id    :bigint(8)
#  league_id  :bigint(8)
#
# Indexes
#
#  index_teams_on_club_id    (club_id)
#  index_teams_on_league_id  (league_id)
#
# Foreign Keys
#
#  fk_rails_...  (club_id => clubs.id)
#  fk_rails_...  (league_id => leagues.id)
#

# A Team is both part of a league and a club
class Team < ApplicationRecord
  resourcify

  belongs_to :club, optional: true
  belongs_to :league, optional: true
  has_many :players, dependent: :nullify
  has_many :matches, dependent: :destroy

  validates :name, uniqueness: {scope: :club_id}
end
