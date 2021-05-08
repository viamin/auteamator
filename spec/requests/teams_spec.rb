# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Teams', type: :request do
  let(:club) { create(:club) }

  describe 'GET /teams' do
    it 'works! (now write some real specs)' do
      get club_teams_path(club_id: club.id)
      expect(response).to have_http_status(:ok)
    end
  end
end
