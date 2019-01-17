# frozen_string_literal: true

# == Schema Information
#
# Table name: players
#
#  id            :bigint(8)        not null, primary key
#  email         :citext
#  first_name    :string
#  last_name     :string
#  mobile_number :string
#  positions     :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  club_id       :bigint(8)
#
# Indexes
#
#  index_players_on_club_id  (club_id)
#

# The Player model tracks the people who are in the clubs and on the teams
# Just what you think. They play the sportball matches.
class Player < ApplicationRecord
  belongs_to :club, optional: true

  def name
    "#{first_name} #{last_name}"
  end
end
