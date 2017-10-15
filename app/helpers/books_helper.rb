module BooksHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    icon_class = column == sort_column ? (sort_direction == 'asc' ? 'fa-caret-up' : 'fa-caret-down') : nil
    link_to sort: column, direction: direction, search: {term: search_params} do
      (title + ' ' + content_tag(:i, '', class: ['fa', icon_class], 'aria-hidden': 'true')).html_safe
    end
  end

end
