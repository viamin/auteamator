# frozen_string_literal: true

# == Schema Information
#
# Table name: football_associations
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# The top level container for everything (except maybe a confederation, which is
# not currently in the scope of Auteamator)
# Besides creating one when initializing the app, you should never have to deal with this
class FootballAssociation < ApplicationRecord
  has_many :clubs, dependent: :nullify
end
