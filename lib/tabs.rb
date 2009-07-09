class Tabs
  
  @@left_tab_array = nil
  @@right_tab_array = nil
  @@active_tab = nil
  
  def initialize(request)
    @@left_tab_array = []
    @@right_tab_array = []
    @@active_tab = request.request_uri
  end
  
  def set_left_tabs(tab_hash)
    temp_array = []
    tab_hash.each do |key, value|
      temp_array << [key, value]
    end
    temp_array.reverse.each do |key, value|
      self.add_left_tab(key, value)
    end
  end
  
  def set_right_tabs(tab_hash)
    temp_array = []
    tab_hash.each do |key, value|
      temp_array << [key, value]
    end
    temp_array.reverse.each do |key, value|
      self.add_right_tab(key, value)
    end
  end
  
  def add_left_tab(name, link)
    @@left_tab_array << [name, link]
  end
  
  def add_right_tab(name, link)
    @@right_tab_array << [name, link]
  end
  
  def set_active_tab(link)
    @@active_tab = link
  end
  
  def to_html
    ret = ""
    ret << "<div class=\"tabnav\" id=\"tabnav\">"
    ret << "<ul style=\"float: left;\">"
    @@left_tab_array.each do |key, value|      
      if @@active_tab.include? value
        ret << "<li><a href=\"#{value}\" class=\"active\">#{key}</a></li>"
      else
        ret << "<li><a href=\"#{value}\">#{key}</a></li>"
      end
    end
    ret << "</ul>"
    ret << "<ul style=\"float: right;\">"
    @@right_tab_array.each do |key, value|      
      if @@active_tab.include? value
        ret << "<li><a href=\"#{value}\" class=\"active\">#{key}</a></li>"
      else
        ret << "<li><a href=\"#{value}\">#{key}</a></li>"
      end
    end
    ret << "</ul>"
    ret << "<div style=\"clear: both;\"></div>"
    ret << "</div>"
    return ret
  end
  
end    