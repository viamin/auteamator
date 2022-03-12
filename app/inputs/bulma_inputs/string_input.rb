# frozen_string_literal: true

module BulmaInputs
  # Ensure the inputs are wrapped in divs with class 'control' and have class 'input'
  class StringInput < SimpleForm::Inputs::StringInput
    def input(wrapper_options)
      template.content_tag(:div, super, class: "control")
    end

    def input_html_classes
      super.push("input")
    end
  end
end
