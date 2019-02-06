# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  # rubocop:disable Rails/LexicallyScopedActionFilter
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  # rubocop:enable Rails/LexicallyScopedActionFilter
  before_action :authenticate_user!
end
