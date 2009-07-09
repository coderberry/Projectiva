ActionController::Routing::Routes.draw do |map|
  map.login  'login',  :controller => "welcome", :action => "login"
  map.logout 'logout', :controller => "welcome", :action => "logout"
  map.signup 'signup', :controller => "welcome", :action => "signup"
  map.terms  'terms',  :controller => "welcome", :action => "terms_of_service"
  
  map.main_welcome    'main_welcome', :controller => "main", :action => "welcome"  
  map.main_dashboard  'main/dashboard', :controller => "main/dashboard"
  map.main_settings   'main/settings/:action/:id', 
                                :controller => "main/settings",
                                :member => {
                                  :color_schemes => :get,
                                  :message_categories => :get,
                                  :file_categories => :get,
                                  :website => :get
                                }
  map.main_companies 'main/companies/:action/:id', :controller => "main/companies"
  map.main_projects  'main/projects/:action/:id',  :controller => "main/projects"  
                         
  map.project_overview   'project/:project_id/overview/:action/:id',   :controller => "project/overview"
  map.project_messages   'project/:project_id/messages/:action/:id',   :controller => "project/messages"
  map.project_todos      'project/:project_id/todos/:action/:id',      :controller => "project/todos"
  map.project_milestones 'project/:project_id/milestones/:action/:id', :controller => "project/milestones"
  map.project_settings 'project/:project_id/settings/:action/:id', :controller => "project/settings"
  
  map.backdoor_default_settings '/backdoor/default_settings/:action/:id', 
                                :controller => "backdoor/default_settings",
                                :member => { 
                                  :color_schemes => :get,
                                  :message_categories => :get,
                                  :file_categories => :get
                                }
  
  map.namespace :backdoor do |backdoor|
    backdoor.resources :accounts
  end
  
  map.root :controller => "welcome"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  map.connect 'stylesheets/:action.:format', :controller => "stylesheets"
end
