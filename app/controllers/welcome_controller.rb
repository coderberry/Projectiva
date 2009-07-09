class WelcomeController < ApplicationController
  
  layout 'welcome'
  
  def index
    redirect_to login_path
  end
  
  def terms_of_service
  end
  
  def login
    if params[:login]
      person = Person.authenticate(params[:login]['username'], params[:login]['password'])
      if person
        session[:account_id] = person.account_id
        session[:user_id] = person.id
        redirect_to main_projects_path and return
      else  
        flash[:notice] = "Invalid username and/or password"
      end
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to :action => "index"
  end
  
  def signup
    @account = Account.new
    @account.timezone = "Mountain Time (US & Canada)" # Default
    @person = Person.new
    if request.post?
      @account = Account.new(params[:account])
      @person = Person.new(params[:person])
      @person.is_admin = true
      @person.is_account_owner = true
      @person.created_by_id = 0
      @person.company_id = 0
      @person.valid? # Trigger the validation
      if @account.save
        @person.account_id = @account.id
        if @person.save
          
          ##
          # Copy defaults to the new account
          DefaultColorScheme.copy_to(@account.id)
          DefaultMessageCategory.copy_to(@account.id)
          DefaultFileCategory.copy_to(@account.id)
          
          session[:account_id] = @account.id
          session[:user_id] = @person.id
          redirect_to main_projects_path and return
        else
          @account.delete
        end
      end
    end
  end
  
end
