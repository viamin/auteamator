# frozen_string_literal: true

json.extract! team, :id, :name, :club_id, :league_id, :created_at, :updated_at
json.url team_url(team, format: :json)
