module ApplicationHelper
  def provide_title(page_title = '')
    base_title = "Farm Story"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
