# frozen_string_literal: true

module BulmaInputs
  # ensure textareas have the 'textarea' class
  class TextInput < SimpleForm::Inputs::TextInput
    def input_html_classes
      super.push("textarea")
    end
  end
end
