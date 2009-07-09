class Project::MessagesController < ProjectController
  
  def index
    @subnav = { :title => 'All Messages' }
    @messages = @project.messages
  end
  
  def new
    @side_contents = "side"
    @subnav = { :title => 'Post a new message' }
    @message = Message.new
  end
  
  def edit
    @side_contents = "side"
    @subnav = { :title => 'Post a new message' }
    @message = Message.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
  end
  
  def create
    @side_contents = "side"
    @subnav = { :title => 'Post a new message' }
    @message = @project.messages.build(params[:message])
    @message.account_id = @account.id
    @message.person_id = @user.id
    if @message.save
      unless params[:company].blank?
        params[:company].each do |key, value|
          MessageSubscriber.create(
            :account_id => @account.id,
            :message_id => @message.id,
            :person_id  => value.split("_")[1]
          )
        end
      end  
      flash[:notice] = "Created message successfully"
      redirect_to project_messages_path
    else
      render :action => "new"
    end
  end
  
  def update
    @side_contents = "side"
    @subnav = { :title => 'Post a new message' }
    @message = Message.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    if @message.update_attributes(params[:message])
      MessageSubscriber.find(:all, :conditions => ["account_id = ? and message_id = ?", @account.id, @message.id]).each { |x| x.destroy }
      unless params[:company].blank?
        params[:company].each do |key, value|
          MessageSubscriber.create(
            :account_id => @account.id,
            :message_id => @message.id,
            :person_id  => key.split("_")[1]
          )
        end
      end  
      flash[:notice] = "Updated message successfully"
      redirect_to project_messages_path
    else
      render :action => "edit"
    end
  end
  
  def show
    @side_contents = "show"
    @message = Message.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
  end
  
  def add_comment_to_message
    @message = Message.find(:first, :conditions => ["id = ? and account_id = ?", params[:id], @account.id])
    comment = Comment.new(
      :account_id => @account.id,
      :message_id => @message.id,
      :person_id => @user.id,
      :body => params[:comment]['body']
    )
    comment.save
    flash[:notice] = "Added comment successfully"
    redirect_to project_messages_path(@project, :show, @message)
  end
  
end