# frozen_string_literal: true

json.extract! football_association, :id, :name, :created_at, :updated_at
json.url football_association_url(football_association, format: :json)
