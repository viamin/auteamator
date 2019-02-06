# frozen_string_literal: true

module BulmaInputs
  class StringInput < SimpleForm::Inputs::StringInput
    def input(wrapper_options)
      template.content_tag(:div, super, class: 'control')
    end

    def input_html_classes
      super.push('input')
    end
  end
end
