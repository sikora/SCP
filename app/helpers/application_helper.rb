module ApplicationHelper
  def nav_link(link_text, link_path, icon)
    class_name = current_page?(link_path) ? 'active' : ''
    icon_class_name = current_page?(link_path) ? 'icon-white' : ''

    content_tag(:li, :class => class_name) do
      link_to(raw("<i class='#{icon} #{icon_class_name}'></i> #{link_text}"), link_path) 
    end
  end
  
  def link_to_pagination_order(name, link_path, column, order)
    asc_or_desc = (order && order[:column] == column && order[:order] == "desc" ? "asc" : "desc")
    icon = "<i class='#{asc_or_desc == "asc" ? "icon-circle-arrow-down" : "icon-circle-arrow-up"}'></i>"
    
    link_to(raw("#{name} #{icon}"), "#{link_path}/order/#{column}/" + asc_or_desc)
  end
end
