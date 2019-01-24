# frozen_string_literal: true

class PagesController < ApplicationController
  include HighVoltage::StaticPage
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped
  skip_before_action :authenticate_user!
end
