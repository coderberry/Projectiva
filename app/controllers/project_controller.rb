class ProjectController < ApplicationController
  
  before_filter :load_account_and_user
  before_filter :load_tabs
  before_filter :set_title
  
  protected
  
  def load_account_and_user
    if session[:account_id].blank? || session[:user_id].blank?
      session[:account_id] = nil
      session[:user_id] = nil
      redirect_to "/" and return
    else
      @project ||= Project.find(session[:project_id])
      @account ||= Account.find(session[:account_id])
      @user ||= Person.find(session[:user_id])
    end
  end
  
  def load_tabs
    @tabs = Tabs.new(request)
    @tabs.set_left_tabs(
      'Overview' => project_overview_path,
      'Messages' => project_messages_path,
      'To-Do' => project_todos_path,
      'Milestones' => project_milestones_path)
    @tabs.set_right_tabs(  
      'Project Settings' => project_settings_path,
      'Back to Projects' => main_projects_path)
  end
  
  protected
  
  def set_title
    @page_title = @project.name
  end
  
end
