# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def translated_value(column, category = 'collections')
    if collection_columns.include?(column)
      send(column).blank? ? '' : I18n.t("#{category}.#{column}.#{send(column)}")
    else
      send(column)
    end
  end

  private

  # override in individual models
  def collection_columns
    []
  end
end
