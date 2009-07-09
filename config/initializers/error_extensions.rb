ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  if instance_tag.error_message.class == Array
    "<span class='field_error'>#{html_tag} #{instance_tag.error_message.first}</span>"
  else
    "<span class='field_error'>#{html_tag} #{instance_tag.error_message}</span>"
  end
end