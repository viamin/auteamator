# frozen_string_literal: true

# == Schema Information
#
# Table name: seasons
#
#  id         :bigint(8)        not null, primary key
#  ends       :datetime
#  starts     :datetime
#  title      :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  league_id  :bigint(8)
#
# Indexes
#
#  index_seasons_on_league_id  (league_id)
#

FactoryBot.define do
  factory :season do
    title { "Spring" }
    url { Faker::Internet.url }
    starts { Faker::Date.backward(60) }
    ends { Faker::Date.forward(60) }
  end
end
