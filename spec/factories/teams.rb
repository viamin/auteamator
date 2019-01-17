# frozen_string_literal: true

# == Schema Information
#
# Table name: teams
#
#  id         :bigint(8)        not null, primary key
#  name       :string
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

FactoryBot.define do
  factory :team do
    association :club
    association :league
    name { 'First Team' }
  end
end
