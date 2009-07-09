class MainController < ApplicationController

  before_filter :load_account_and_user
  before_filter :load_tabs
  
  def welcome
    redirect_to main_dashboard_path
  end
  
  protected
  
  def load_account_and_user
    if session[:account_id].blank? || session[:user_id].blank?
      session[:account_id] = nil
      session[:user_id] = nil
      redirect_to "/" and return
    else
      @account ||= Account.find(session[:account_id])
      @user ||= Person.find(session[:user_id])
    end
  end
  
  def load_tabs
    @tabs = Tabs.new(request)
    @tabs.set_left_tabs(
      'Projects' => main_projects_path )
    @tabs.set_right_tabs(
      'All People' => main_companies_path,
      'Settings' => main_settings_path )
  end
  
end
