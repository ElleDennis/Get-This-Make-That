module ApplicationHelper
  def display_form_errors(resource)
    if resource.errors.any?
      content_tag(:div, class: 'alert alert-danger') do
        html =  ''
        html << content_tag(:p, 'Sorry. We were unable to proceed because:')
        html << content_tag(:ul) do
          resource.errors.full_messages.
            map { |msg| content_tag(:li, msg) }.
            join('')
            .html_safe
        end
        html.html_safe
      end
    end
  end
end
