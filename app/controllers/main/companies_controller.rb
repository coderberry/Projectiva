class Main::CompaniesController < MainController
  
  def index
    @subnav = { :title => 'Every company and person in your system' }
    @companies = @account.companies
    @personal_people = Person.find(:all, :conditions => ["company_id = ? and account_id = ?", 0, @account.id])
  end
  
  ## COMPANIES #####################################
  
  def new_company
    @subnav = { :title => 'Add a New Company' }
    @company = @account.companies.build
    @company.timezone = @account.timezone
    @side_contents = "company"
  end
  
  def create_company
    @side_contents = "company"
    @subnav = { :title => 'Update Company' }
    @company = Company.new(params[:company])
    @company.account_id = @account.id
    @company.created_by_id = @user.id
    if @company.save
      flash[:notice] = "Added company successfully"
      redirect_to :action => "index"
    else
      render :action => "new_company"
    end
  end
  
  def edit_company
    @side_contents = "company"
    @subnav = { :title => 'Edit Company' }
    @company = Company.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
  end
  
  def update_company
    @side_contents = "company"
    @subnav = { :title => 'Update Company' }
    @company = Company.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    if @company.update_attributes(params[:company])
      flash[:notice] = "Updated company successfully"
      redirect_to :action => "index"
    else
      render :action => "edit_company"
    end
  end
  
  ## PEOPLE #####################################
  
  def new_person
    @subnav = { :title => 'Add a Person' }
    @person = Person.new
    @person.company_id = params[:id]
    @side_contents = "person"
  end
  
  def create_person
    @side_contents = "person"
    @subnav = { :title => 'Update Person' }
    @person = Person.new(params[:person])
    @person.account_id = @account.id
    @person.created_by_id = @user.id
    if @person.save
      
      # Send email to new person
      #Mailer.deliver_new_person_email(@account, @person, @user)
      
      flash[:notice] = "Added #{@person.full_name} successfully"
      redirect_to :action => "index"
      
    else
      render :action => "new_person"
    end
  end
  
  def edit_person
    @subnav = { :title => 'Edit Person' }
    @person = Person.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
  end
  
  def update_person
    @side_contents = "edit_person"
    @subnav = { :title => 'Update Person' }
    @person = Person.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    if @person.update_attributes(params[:person])
      flash[:notice] = "Updated #{@person.full_name} successfully"
      redirect_to :action => "index"
    else
      render :action => "edit_person"
    end
  end
  
  def delete_person
    person = Person.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    if person
      person.destroy
      flash[:notice] = "Person was removed successfully"
    end
    redirect_to :action => "index"
  end
  
end
