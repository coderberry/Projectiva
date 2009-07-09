class Project::OverviewController < ProjectController
  
  def index
    @subnav = { :title => 'Project overview & activity' }
    
    milestones = @project.all_milestones
    if @project.to_do_lists.length > 0
      todos = ToDoItem.find(:all, :conditions => ["to_do_list_id in (#{@project.to_do_lists.collect{|tdl| tdl.id }.join(',')})"])
    else
      todos = []
    end
    messages = @project.messages
    
    @data = Hash.new
    
    # Add Milestones
    milestones.each do |milestone|
      if @data[milestone.date_due].blank?
        @data[milestone.created_at.strftime("%Y-%m-%d")] = []
      end
      @data[milestone.created_at.strftime("%Y-%m-%d")] << milestone
    end
    
    todos.each do |todo|
      if @data[todo.created_at.strftime("%Y-%m-%d")].blank?
        @data[todo.created_at.strftime("%Y-%m-%d")] = []
      end
      @data[todo.created_at.strftime("%Y-%m-%d")] << todo
    end
    
    messages.each do |message|
      if @data[message.created_at.strftime("%Y-%m-%d")].blank?
        @data[message.created_at.strftime("%Y-%m-%d")] = []
      end
      @data[message.created_at.strftime("%Y-%m-%d")] << message
    end
    
  end
  
end
