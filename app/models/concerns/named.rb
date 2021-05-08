module Named
  extend ActiveSupport::Concern

  def to_s
    name
  end
end