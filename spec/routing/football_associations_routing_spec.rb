# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FootballAssociationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/football_associations').to route_to('football_associations#index')
    end

    it 'routes to #new' do
      expect(get: '/football_associations/new').to route_to('football_associations#new')
    end

    it 'routes to #show' do
      expect(get: '/football_associations/1').to route_to('football_associations#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/football_associations/1/edit').to route_to('football_associations#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/football_associations').to route_to('football_associations#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/football_associations/1').to route_to('football_associations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/football_associations/1').to route_to('football_associations#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/football_associations/1').to route_to('football_associations#destroy', id: '1')
    end
  end
end
