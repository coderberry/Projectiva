class SimpleAttachment < ActiveRecord::Base
  
  has_attachment :storage => :file_system,
                 :path => 'public/files',
                 :max_size => 2000.kilobytes,
                 :thumbnails => { :thumb => '32x32>' }

  validates_as_attachment
  
end
