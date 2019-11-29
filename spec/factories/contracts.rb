# frozen_string_literal: true

# == Schema Information
#
# Table name: contracts
#
#  id           :bigint(8)        not null, primary key
#  first_active :datetime
#  last_active  :datetime
#  status       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  club_id      :bigint(8)
#  player_id    :bigint(8)
#
# Indexes
#
#  index_contracts_on_club_id    (club_id)
#  index_contracts_on_player_id  (player_id)
#
# Foreign Keys
#
#  fk_rails_...  (club_id => clubs.id)
#  fk_rails_...  (player_id => players.id)
#

FactoryBot.define do
  factory :contract do
    player
    club
    season
    status { 1 }
  end
end
