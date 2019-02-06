# frozen_string_literal: true

json.extract! league, :id, :age_restriction, :day, :description, :format, :gender_restriction, :level, :name, :relegation, :skill_level, :created_at, :updated_at
json.url league_url(league, format: :json)

age_restriction         :string
#  day                     :string
#  description             :string
#  format                  :string
#  gender_restriction      :string
#  level                   :integer
#  name                    :string
#  relegation              :boolean
#  skill_level