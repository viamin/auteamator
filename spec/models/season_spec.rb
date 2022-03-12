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

require "rails_helper"

RSpec.describe Season, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
