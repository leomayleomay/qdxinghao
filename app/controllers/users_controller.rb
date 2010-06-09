class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  load_and_authorize_resource
  before_filter :login_required, :only => [:index]
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/')
      flash[:notice] = "注册成功！"
    else
      flash[:error]  = "注册失败！"
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = "修改成功！"
      redirect_to @user
    else
      flash[:error] = "修改失败！"
      render :action => :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    
    if @user.destroy
      flash[:notice] = "删除成功！"
      redirect_to home_path
    end
  end
end
