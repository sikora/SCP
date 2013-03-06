module ApplicationHelper
  def nav_link(link_text, link_path, icon, id='')
    class_name = current_page?(link_path) ? 'active' : ''
    icon_class_name = current_page?(link_path) ? 'icon-white' : ''

    content_tag(:li, :class => class_name) do
      link_to(raw("<i class='#{icon} #{icon_class_name}'></i> #{link_text}"), link_path, :id => id)
    end
  end

  def link_to_pagination_order(name, link_path, column, order)
    asc_or_desc = (order && order[:column] == column && order[:order] == "desc" ? "asc" : "desc")
    icon = "<i class='#{asc_or_desc == "asc" ? "icon-circle-arrow-down" : "icon-circle-arrow-up"}'></i>"

    link_to(raw("#{name} #{icon}"), "#{link_path}/order/#{column}/" + asc_or_desc)
  end

  # Helper para adicionar mensagens na aplicação
  # flash: {success : "mensagem de sucesso"}
  # flash: {info    : "mensagem de informação"}
  # flash: {alert   : "mensagem de alerta"}
  # flash: {error   : "mensagem de erro"}
  # @return flash
  def message
    html_message = ''

    [:success, :info, :alert, :error].each {|tipo|
      if flash[tipo]
        html_message << '<div id="alert-message">'
        html_message << "<div class='alert #{"alert-#{tipo}" if tipo != :alert} alert-block fade in'>"
        html_message << '<button type="button" class="close" data-dismiss="alert">&times;</button>'
        html_message << flash[tipo]
        html_message << '</div>'
        html_message << '</div>'
      end
    }

    raw(html_message)
  end
end
