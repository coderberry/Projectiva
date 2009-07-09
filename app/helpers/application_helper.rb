# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def display_flash(flash)
    if !flash[:notice].blank?
      flash_wrapper("notice", flash[:notice])
    elsif !flash[:warning].blank?
      flash_wrapper("warning", flash[:warning])
    elsif !flash[:error].blank?
      flash_wrapper("error", flash[:error])
    end
  end
  
  def flash_wrapper(flash_type, message)
    "<div class=\"#{flash_type}\">#{message}</div>"
  end
  
  def sub_navigation_bar(nav_links)
    if nav_links
      if nav_links.keys.include? :title
        "<div class=\"sub_nav\"><h2 style=\"padding: 5px 10px; font-size: 1.3em;\">#{nav_links[:title]}</h2></div>"
      else
        links = []
        nav_links.each do |key, value|
          if value == request.request_uri
            links << "<li>#{[link_to(key, value, :class => 'active')]}</li>"
          else
            links << "<li>#{[link_to(key, value)]}</li>"
          end
        end
        "<div class=\"sub_nav\"><ul>#{links.reverse}</ul></div>"
      end
    end
  end
  
  def display_tip(title = 'Tip', &block)
    data = capture(&block)
    res = "<div class=\"tip\"><h4>#{title}</h4>#{data}</div>"
    concat(res, block.binding)
  end
  
end
