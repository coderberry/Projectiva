class Backdoor::AccountsController < BackdoorController
  
  def index
    @accounts = Account.find(:all)
  end
  
end
