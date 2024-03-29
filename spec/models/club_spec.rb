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

require "rails_helper"

RSpec.describe Club, type: :model do
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:football_association_id) }
end
