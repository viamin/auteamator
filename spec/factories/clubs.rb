# frozen_string_literal: true

# == Schema Information
#
# Table name: clubs
#
#  id                      :bigint(8)        not null, primary key
#  name                    :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  football_association_id :bigint(8)
#
# Indexes
#
#  index_clubs_on_football_association_id  (football_association_id)
#

FactoryBot.define do
  factory :club do
    name { Faker::Sports::Football.team }
    association :football_association
  end
end
