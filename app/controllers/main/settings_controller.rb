class Main::SettingsController < MainController

  before_filter :load_sub_navigation
  
  def index
    redirect_to main_settings_path(:color_schemes)
  end
  
  ## Color Schemes #########################################
  
  def color_schemes
    @color_schemes = @account.color_schemes
  end
    
  def update_color_schemes
    @side_contents = "color_schemes"
    changes = params[:color_scheme]
    changes.each do |key, value|
      cs = ColorScheme.find(:first, :conditions => ["account_id = ? and name = ?", session[:account_id], key])
      if cs
        cs.hex_value = value
        unless cs.save
          flash[:notice] = "You have tried using invalid HEX codes.  Please refer to <a href=\"http://www.colorschemer.com/online.html\">here</a> for more information on HEX color codes."
        end
      else
        raise "Unable to find Color Scheme"
      end
    end
    redirect_to main_settings_path(:color_schemes)
  end
  
  def revert_colors_to_original
    @account.color_schemes.each { |cs| cs.destroy }
    DefaultColorScheme.copy_to(@account.id)
    flash[:notice] = "Your color schemes have been reset to the default colors"
    redirect_to :action => "color_schemes"
  end
  
  ## Message Categories #########################################
  
  def message_categories
    @message_categories = @account.message_categories
  end
  
  def new_message_category
    @message_category = MessageCategory.new
    @subnav = { :title => 'New Message Category' }
  end
  
  def add_message_category
    @subnav = { :title => 'New Message Category' }
    @side_contents = "new_message_category"
    @message_category = MessageCategory.new(params[:message_category])
    @message_category.account_id = @account.id
    @message_category.created_by_id = @user.id
    if @message_category.save
      flash[:notice] = "Added message category successfully"
      redirect_to main_settings_path(:message_categories)
    else
      render :action => "new_message_category"
    end
  end
  
  def edit_message_category
    @message_category = MessageCategory.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    @subnav = { :title => 'Modify Message Category' }
  end
  
  def update_message_category
    edit_message_category
    @side_contents = "edit_message_category"
    @message_category = MessageCategory.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    if @message_category.update_attributes(params[:message_category])
      flash[:notice] = "Updated the message category successfully"
      redirect_to main_settings_path(:message_categories)
    else
      render :action => "edit_message_category"
    end
  end
  
  def delete_message_category
    if request.post?
      MessageCategory.find(:all, :conditions => ["id = ? and account_id = ?", params[:id], @account.id ]).each { |x| x.destroy }
      redirect_to main_settings_path(:message_categories)
    else
      redirect_to root_path
    end
  end
  
  ## File Categories #########################################
  
  def file_categories
    @file_categories = @account.file_categories
  end
  
  def new_file_category
    @file_category = FileCategory.new
    @subnav = { :title => 'New File Category' }
  end
  
  def add_file_category
    @subnav = { :title => 'New File Category' }
    @side_contents = "new_file_category"
    @file_category = FileCategory.new(params[:file_category])
    @file_category.account_id = @account.id
    @file_category.created_by_id = @user.id
    if @file_category.save
      flash[:notice] = "Added file category successfully"
      redirect_to main_settings_path(:file_categories)
    else
      render :action => "new_file_category"
    end
  end
  
  def edit_file_category
    @file_category = FileCategory.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    @subnav = { :title => 'Modify File Category' }
  end
  
  def update_file_category
    edit_file_category
    @side_contents = "edit_message_category"
    @file_category = FileCategory.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    if @file_category.update_attributes(params[:file_category])
      flash[:notice] = "Updated the message category successfully"
      redirect_to main_settings_path(:file_categories)
    else
      render :action => "edit_file_category"
    end
  end
  
  def delete_file_category
    if request.post?
      FileCategory.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id]).destroy
      redirect_to main_settings_path(:file_categories)
    else
      redirect_to root_path
    end
  end
  
  ## Website Settings #########################################
  
  def website
    
  end
  
  def update_website
    if @account.update_attributes(params[:website])
      flash[:notice] = "Updated website &amp; account settings successfully"
      redirect_to main_settings_path(:website)
    else
      render :partial => "website"
    end
  end
  
  private
  
  def load_sub_navigation
    @subnav = {
      'Color Schemes' => main_settings_path(:color_schemes),
      'Message Categories' => main_settings_path(:message_categories),
      'File Categories' => main_settings_path(:file_categories),
      'Website Settings' => main_settings_path(:website)
    }
  end
  
end
