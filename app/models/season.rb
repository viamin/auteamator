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

# A season is a group of fixtures with a start and end date, belonging to a league
class Season < ApplicationRecord
  belongs_to :league, optional: false
  has_many :matches, dependent: :destroy

  validate :ends_is_after_starts

  private

  def ends_is_after_starts
    errors.add(:ends, 'must be after starts') if ends && starts && ends < starts
  end
end
