# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  before_action :authenticate_user!
end
