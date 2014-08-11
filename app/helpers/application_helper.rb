module ApplicationHelper
  def nav_tabs(tabs = {})
    res = tabs.collect do |tab|
      content_tag :li, :class => request.fullpath.split(/[\??]/)[0] == tab[1] ? 'active' : '' do
        link_to tab[0], tab[1]
      end
    end

    content_tag :ul, :class => "nav navbar-nav" do
      res.join.html_safe
    end
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to(title, {sort: column, direction: direction, list_view: params[:list_view] }, {class: css_class}) + 
      content_tag(:span, " ", class: direction == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down")
  end
end
