class Project::MilestonesController < ProjectController
  
  before_filter :set_presets
  
  def index
    @subnav = { :title => 'Milestones' }
    @milestones = @project.milestones
    @completed_milestones = @project.completed_milestones
  end
  
  def new
    @subnav = { :title => 'Add a new milestones' }
    @side_contents = "side"
    @milestone = Milestone.new(:date_due => Time.now + 1.week)
  end
  
  def create
    @milestone = Milestone.new(params[:milestone])
    @milestone.date_due = params[:date_due]
    @milestone.account_id = @account.id
    @milestone.created_by_id = @user.id
    @milestone.project_id = @project.id
    responsible_array = params['responsible'].split("_")
    case responsible_array[0]
      when "company"
        @milestone.responsible_company_id = responsible_array[1]
      else
        @milestone.responsible_person_id = responsible_array[1]
    end
    
    if @milestone.save
      flash[:notice] = "Created milestone successfully"
      redirect_to project_milestones_path(@project)
      
    else
      @subnav = { :title => 'Add a new milestones' }
      @side_contents = "side"
      render :action => "new"
      
    end
  end
  
  def edit
    @subnav = { :title => 'Edit milestone' }
    @side_contents = "side"
    @milestone = Milestone.find(:first, :conditions => ["account_id = ? and id = ?", @account.id, params[:id]])
  end
  
  def update
    @milestone = Milestone.find(:first, :conditions => ["account_id = ? and id = ?", @account.id, params[:id]])
    @milestone.date_due = params[:date_due]
    responsible_array = params['responsible'].split("_")
    case responsible_array[0]
      when "company"
        @milestone.responsible_person_id = nil
        @milestone.responsible_company_id = responsible_array[1]
      else
        @milestone.responsible_company_id = nil
        @milestone.responsible_person_id = responsible_array[1]
    end
    
    if @milestone.update_attributes(params[:milestone])
      flash[:notice] = "Updated milestone successfully"
      redirect_to project_milestones_path(@project)
      
    else
      @subnav = { :title => 'Edit milestone' }
      @side_contents = "side"
      render :action => "edit"
      
    end
  end
  
  def destroy 
    @milestone = Milestone.find(:first, :conditions => ["account_id = ? and id = ?", @account.id, params[:id]])
    if @milestone
      @milestone.destroy
      flash[:notice] = "Deleted milestone successfully"
      redirect_to project_milestones_path(@project)
    else
      flash[:warning] = "You are not authorized to access this milestone"
      redirect_to project_milestones_path(@project)
    end
  end
  
  def mark_as_completed
    @milestone = Milestone.find(:first, :conditions => ["account_id = ? and id = ?", @account.id, params[:id]])
    if @milestone
      @milestone.is_complete = true
      @milestone.save
      flash[:warning] = "Marked milestone as complete"
      redirect_to project_milestones_path(@project)
    else
      flash[:warning] = "You are not authorized to access this milestone"
      redirect_to project_milestones_path(@project)
    end
  end
  
  def mark_as_incomplete
    @milestone = Milestone.find(:first, :conditions => ["account_id = ? and id = ?", @account.id, params[:id]])
    if @milestone
      @milestone.is_complete = false
      @milestone.save
      flash[:warning] = "Marked milestone as incomplete"
      redirect_to project_milestones_path(@project)
    else
      flash[:warning] = "You are not authorized to access this milestone"
      redirect_to project_milestones_path(@project)
    end
  end
  
  private
  
  def set_presets
    @use_calendar = true
  end
  
end
