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

require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { build(:player) }

  it { is_expected.to validate_presence_of(:first_name) }

  it 'returns full name' do
    expect(player.name).to eq(player.first_name + ' ' + player.last_name)
  end
end
