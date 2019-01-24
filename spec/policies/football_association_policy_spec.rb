# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FootballAssociationPolicy do
  subject(:policy_scope) { FootballAssociationPolicy::Scope.new(user, scope).resolve }

  let(:user) { build(:user) }
  let(:football_association) { create(:football_association) }

  let(:anyone) { described_class.new(user, football_association) }
  let(:scope) { FootballAssociation.all }

  permissions '.scope' do
    context 'with any user' do
      before { football_association }

      it 'finds the association' do
        expect(policy_scope).to match_array([football_association])
      end
    end
  end

  permissions :show? do
    it 'allows anyone to show' do
      expect(anyone).to permit_action(:show)
    end
  end

  permissions :create? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :update? do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  permissions :destroy? do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
