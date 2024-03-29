# frozen_string_literal: true

# == Schema Information
#
# Table name: fields
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  name        :string
#  number      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :bigint(8)
#
# Indexes
#
#  index_fields_on_location_id  (location_id)
#
# Foreign Keys
#
#  fk_rails_...  (location_id => locations.id)
#

FactoryBot.define do
  factory :field do
    name { "" }
    number { 1 }
    association :location
    description { Faker::Lorem.sentence }
  end
end
