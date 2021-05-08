# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'FootballAssociations', type: :request do
  describe 'GET /football_associations' do
    it 'works! (now write some real specs)' do
      get football_associations_path
      expect(response).to have_http_status(:ok)
    end
  end
end
