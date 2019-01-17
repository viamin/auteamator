# frozen_string_literal: true

# == Schema Information
#
# Table name: locations
#
#  id           :bigint(8)        not null, primary key
#  address      :string
#  all_weather  :boolean
#  city         :string
#  fields_count :integer          default(0), not null
#  lights       :boolean
#  map          :string
#  name         :string
#  state        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :location do
    transient do
      fields { 4 }
    end

    address { Faker::Address.street_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    map { '' }
    name { Faker::RickAndMorty.location }
    all_weather { [true, false].sample }
    lights { [true, false].sample }

    after(:build) do |location, evaluator|
      build_list(:field, evaluator.fields, location: location)
    end

    after(:create) do |location, evaluator|
      create_list(:field, evaluator.fields, location: location)
    end
  end
end
