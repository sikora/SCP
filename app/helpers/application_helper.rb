module ApplicationHelper
  def nav_link(link_text, link_path, icon)
    class_name = current_page?(link_path) ? 'active' : ''
    icon_class_name = current_page?(link_path) ? 'icon-white' : ''

    content_tag(:li, :class => class_name) do
      link_to(raw("<i class='#{icon} #{icon_class_name}'></i> #{link_text}"), link_path) 
    end
  end
end
