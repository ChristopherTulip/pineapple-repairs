module ApplicationHelper
  def nav_link(link_text, link_path, method=:get)
    class_name = current_page?(link_path) ? 'current' : ''

    content_tag(:li, :class => class_name,) do
      link_to link_text, link_path, method: method
    end
  end
end
