class Project::TodosController < ProjectController
  
  def index
    @subnav = { :title => 'To-do lists' }
    @to_do_lists = ToDoList.find(:all, :conditions => ["project_id = ? and account_id = ?", @project.id, @account.id], :order => "name", :include => [:to_do_items])
  end
  
  def new
    @subnav = { :title => 'Create new to-do list' }
    @side_contents = "side"
    @milestones = @project.all_milestones
    @to_do_list = ToDoList.new
  end
  
  def create
    @to_do_list = ToDoList.new(params[:to_do_list])
    @to_do_list.account_id    = @account.id
    @to_do_list.created_by_id = @user.id
    @to_do_list.project_id    = @project.id
    if @to_do_list.save
      flash[:notice] = "Added to-do list successfully"
      redirect_to project_todos_path(@project)
    else
      @subnav = { :title => 'Create new to-do list' }
      @side_contents = "side"
      @milestones = @project.all_milestones
      render :action => "new"
    end
  end
  
  def add_item_to_list
    to_do_list = ToDoList.find(params[:id])
    @item = ToDoItem.new(
      :created_by_id => @user.id,
      :description => params[:to_do_item]['description'],
      :account_id => @account.id,
      :to_do_list_id => to_do_list.id,
      :is_complete => false
    )
    
    responsible_array = params['responsible'].split("_")
    case responsible_array[0]
      when "company"
        @item.responsible_company_id = responsible_array[1]
      else
        @item.responsible_person_id = responsible_array[1]
    end
    
    if !@item.save
      flash[:warning] = "Unable to add to-do item"
    end
    
    redirect_to :action => "index"
    
  end
  
  def complete_item
    @item = ToDoItem.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    if @item.is_complete
      @item.is_complete = false
      @item.date_time_completed = nil
    else
      @item.is_complete = true
      @item.date_time_completed = Time.now
    end
    @item.save
    render :nothing => true
  end
  
end
