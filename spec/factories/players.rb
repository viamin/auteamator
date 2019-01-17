# frozen_string_literal: true

# == Schema Information
#
# Table name: players
#
#  id            :bigint(8)        not null, primary key
#  email         :citext
#  first_name    :string
#  last_name     :string
#  mobile_number :string
#  positions     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  club_id       :bigint(8)
#
# Indexes
#
#  index_players_on_club_id  (club_id)
#

FactoryBot.define do
  factory :player do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    mobile_number { Faker::PhoneNumber.cell_phone }
    positions { ['Goalkeeper', 'Center Defender', 'Outside Defender', 'Center Midfielder', 'Outside Midfielder', 'Striker'].sample } # rubocop:disable Metrics/LineLength
    association :club
  end
end
