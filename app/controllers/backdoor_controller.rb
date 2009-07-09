class BackdoorController < ApplicationController
  
  layout 'backdoor'
  before_filter :authenticate, :except => [:login, :logout]
  before_filter :load_tabs
  
  def login
    if request.post?
      backdoor_admin_creds = YAML.load(File.open("#{RAILS_ROOT}/config/administrators.yml"))
      if params[:login]['username'] == backdoor_admin_creds['eric']['username'] &&
         params[:login]['password'] == backdoor_admin_creds['eric']['password']
         session[:super_duper_admin] = backdoor_admin_creds['eric']['name']
         redirect_to backdoor_accounts_path and return
      end
    end
    render :layout => 'backdoor_login'
  end
  
  def logout
    session[:super_duper_admin] = nil
    flash[:notice] = "Logged out successfully"
    redirect_to :action => "login"
  end
  
  protected
  
  def authenticate
    if session[:super_duper_admin].blank?
      redirect_to "/backdoor/login"
      return
    end
  end
  
  def load_tabs
    @tabs = Tabs.new(request)
    @tabs.set_left_tabs(
      'Accounts' => backdoor_accounts_path )
    @tabs.set_right_tabs(
      'Default Settings' => backdoor_default_settings_path )
  end
  
end