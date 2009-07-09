class Backdoor::DefaultSettingsController < BackdoorController
  
  before_filter :load_sub_navigation
  
  def index
    redirect_to backdoor_default_settings_path(:color_schemes)
  end
  
  ## Color Schemes #########################################
  
  def color_schemes
    @color_schemes = DefaultColorScheme.all
  end
  
  def new_color_scheme
    @color_scheme = DefaultColorScheme.new
    @subnav = { :title => 'New Default Color Scheme' }
  end
  
  def add_color_scheme
    @subnav = { :title => 'New Default Color Scheme' }
    @side_contents = "new_color_scheme"
    @color_scheme = DefaultColorScheme.new(params[:color_scheme])
    if @color_scheme.save
      flash[:notice] = "Added default color scheme successfully"
      redirect_to backdoor_default_settings_path(:color_schemes)
    else
      render :action => "new_color_scheme"
    end
  end
  
  def edit_color_scheme
    @color_scheme = DefaultColorScheme.find(params[:id])
    @subnav = { :title => 'Modify Default Color Scheme' }
  end
  
  def update_color_scheme
    edit_color_scheme
    @side_contents = "edit_color_scheme"
    if @color_scheme.update_attributes(params[:color_scheme])
      flash[:notice] = "Updated the default color scheme successfully"
      redirect_to backdoor_default_settings_path(:color_schemes)
    else
      render :action => "edit_color_scheme"
    end
  end
  
  def delete_color_scheme
    if request.post?
      DefaultColorScheme.find(params[:id]).destroy
      redirect_to backdoor_default_settings_path(:color_schemes)
    else
      redirect_to root_path
    end
  end
  
  ## Message Categories #########################################
  
  def message_categories
    @message_categories = DefaultMessageCategory.all
  end
  
  def new_message_category
    @message_category = DefaultMessageCategory.new
    @subnav = { :title => 'New Default Message Category' }
  end
  
  def add_message_category
    @subnav = { :title => 'New Default Message Category' }
    @side_contents = "new_message_category"
    @message_category = DefaultMessageCategory.new(params[:message_category])
    if @message_category.save
      flash[:notice] = "Added default message category successfully"
      redirect_to backdoor_default_settings_path(:message_categories)
    else
      render :action => "new_message_category"
    end
  end
  
  def edit_message_category
    @message_category = DefaultMessageCategory.find(params[:id])
    @subnav = { :title => 'Modify Default Message Category' }
  end
  
  def update_message_category
    edit_message_category
    @side_contents = "edit_message_category"
    if @message_category.update_attributes(params[:message_category])
      flash[:notice] = "Updated the default message category successfully"
      redirect_to backdoor_default_settings_path(:message_categories)
    else
      render :action => "edit_message_category"
    end
  end
  
  def delete_message_category
    if request.post?
      DefaultMessageCategory.find(params[:id]).destroy
      redirect_to backdoor_default_settings_path(:message_categories)
    else
      redirect_to root_path
    end
  end
  
  ## File Categories #########################################
  
  def file_categories
    @file_categories = DefaultFileCategory.all
  end
  
  def new_file_category
    @file_category = DefaultFileCategory.new
    @subnav = { :title => 'New Default File Category' }
  end
  
  def add_file_category
    @subnav = { :title => 'New Default File Category' }
    @side_contents = "new_file_category"
    @file_category = DefaultFileCategory.new(params[:file_category])
    if @file_category.save
      flash[:notice] = "Added default file category successfully"
      redirect_to backdoor_default_settings_path(:file_categories)
    else
      render :action => "new_file_category"
    end
  end
  
  def edit_file_category
    @file_category = DefaultFileCategory.find(params[:id])
    @subnav = { :title => 'Modify Default File Category' }
  end
  
  def update_file_category
    edit_file_category
    @side_contents = "edit_message_category"
    if @file_category.update_attributes(params[:file_category])
      flash[:notice] = "Updated the default message category successfully"
      redirect_to backdoor_default_settings_path(:file_categories)
    else
      render :action => "edit_file_category"
    end
  end
  
  def delete_file_category
    if request.post?
      DefaultFileCategory.find(params[:id]).destroy
      redirect_to backdoor_default_settings_path(:file_categories)
    else
      redirect_to root_path
    end
  end
  
  private
  
  def load_sub_navigation
    @subnav = {
      'Color Schemes' => backdoor_default_settings_path(:color_schemes),
      'Message Categories' => backdoor_default_settings_path(:message_categories),
      'File Categories' => backdoor_default_settings_path(:file_categories),
    }
  end
  
end
