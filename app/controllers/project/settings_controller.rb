class Project::SettingsController < ProjectController
  
  def index
  end
  
  def update
    @project = Project.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Updated project successfully"
      redirect_to :action => "index"
    else
      render :action => "index"
    end
  end
  
end
