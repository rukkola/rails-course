module ApplicationHelper
  
  def urls_to_content(str)
    str.gsub!(%r{https://[^\s<]+}) do |url|
      if url[/(?:png|jpe?g|gif|svg])$/]
      "<img src='#{url}' width='100'; />"
      else
        #"<a href='#{url}'>#{url}<a/>"
        "<a href='#{url}' target='_blank'>Link to info<a/>" # target='_blank' открывает новую вкладку
      end
    end
    str.html_safe
  end
end