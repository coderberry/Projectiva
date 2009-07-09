class Main::ProjectsController < MainController
  
  def index
    @projects = @account.projects
    @subnav = { :title => 'All Projects' }
  end
  
  def new
    @project = Project.new
  end
  
  def edit
    @project = Project.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
  end
  
  def create
    @project = Project.new(params[:project])
    @project.account_id = @account.id
    if @project.save
      flash[:notice] = "Created project successfully"
      session[:project_id] = @project.id
      redirect_to :controller => project_overview_path(@project)
    else
      @side_contents = "new"
      render :action => "new"
    end
  end
  
  def update
    @project = Project.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Updated project successfully"
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @project = Project.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    if @project
      @project.destroy
      flash[:notice] = "Deleted project successfully"
    end
    redirect_to :action => "index"
  end
  
  def go_to_project
    project = Project.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    if project
      session[:project_id] = params[:id]
      redirect_to project_overview_path(project)
    else
      flash[:notice] = "Invalid Project"
      redirect_to :action => "index"
    end
  end
  
end
