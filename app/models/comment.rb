class Comment < ActiveRecord::Base
  
  belongs_to :message
  
  validates_presence_of :body, :account_id, :message_id, :person_id
  
  def person
    @person ||= Person.find(person_id)
  end
  
end
