module ApplicationHelper
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end
  

end
