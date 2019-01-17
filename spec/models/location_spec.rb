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

require 'rails_helper'

RSpec.describe Location, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
