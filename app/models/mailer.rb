class Mailer < ActionMailer::Base
  
  def new_person_email(account, person, user, sent_at = Time.now)
    @from         = "noreply@taskb.us"
    @subject      = "You now have access to #{account.sub_domain}.#{account.domain}"
    @recipients   = person.email
    @body         = { :account => account, :person => person, :user => user }
    @sent_on      = sent_at
  end

end
