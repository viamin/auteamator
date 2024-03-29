# frozen_string_literal: true

# == Schema Information
#
# Table name: leagues
#
#  id                      :bigint(8)        not null, primary key
#  age_restriction         :string
#  day                     :string
#  description             :string
#  format                  :string
#  gender_restriction      :string
#  level                   :integer
#  name                    :string
#  relegation              :boolean
#  skill_level             :string
#  url                     :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  football_association_id :bigint(8)
#
# Indexes
#
#  index_leagues_on_football_association_id  (football_association_id)
#
# Foreign Keys
#
#  fk_rails_...  (football_association_id => football_associations.id)
#

require "rails_helper"

RSpec.describe League, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
