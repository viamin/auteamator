# frozen_string_literal: true

# == Schema Information
#
# Table name: matches
#
#  id               :bigint(8)        not null, primary key
#  kickoff          :datetime
#  result           :jsonb
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  field_id         :bigint(8)
#  home_team_id     :bigint(8)
#  season_id        :bigint(8)
#  visiting_team_id :bigint(8)
#
# Indexes
#
#  index_matches_on_field_id          (field_id)
#  index_matches_on_home_team_id      (home_team_id)
#  index_matches_on_season_id         (season_id)
#  index_matches_on_visiting_team_id  (visiting_team_id)
#
# Foreign Keys
#
#  fk_rails_...  (field_id => fields.id)
#  fk_rails_...  (home_team_id => teams.id)
#  fk_rails_...  (season_id => seasons.id)
#  fk_rails_...  (visiting_team_id => teams.id)
#

FactoryBot.define do
  factory :match do
    kickoff { Faker::Time.forward(10) }
    result { '' }
    association :field
    association :season
    association :home_team, factory: :team
    association :visiting_team, factory: :team
  end
end
