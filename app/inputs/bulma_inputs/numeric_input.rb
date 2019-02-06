# frozen_string_literal: true

module BulmaInputs
  class NumericInput < SimpleForm::Inputs::NumericInput
    def input(wrapper_options)
      template.content_tag(:div, super, class: 'control')
    end

    def input_html_classes
      super.push('input')
    end
  end
end
