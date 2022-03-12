# frozen_string_literal: true

# == Schema Information
#
# Table name: football_associations
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :football_association do
    name { "MyFA" }
    url { Faker::Internet.url }
  end
end
