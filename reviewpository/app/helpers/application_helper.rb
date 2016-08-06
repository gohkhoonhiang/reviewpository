# reference: http://stackoverflow.com/questions/22183500/how-to-extend-a-core-rails-formbuilder-field
module ApplicationHelper
  class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
    def form_group(field, options = nil, &block)
      div_opts = {:class => "form-group"}
      if !@object.errors[field.to_s].empty?
        div_opts[:class] << " has-error"
      end
      @template.content_tag(:div, div_opts) { yield }
    end

    def help_block(field, options = nil, &block)
      content = ""
      if !@object.errors[field.to_s].empty?
        content = @template.content_tag(:span, @object.errors.full_messages_for(field).join(", "), class: "help-block")
      end
      content
    end
  end
end
