class UsersController < ApplicationController
  before_filter :set_user, except: [:index, :new, :create]
  before_filter :login_required, :only => [:edit, :update]
  before_filter :admin_required, :only => [:destroy]
  before_filter :confirm_user_owns_record, :only => [:edit, :update]
  def index
    unless read_fragment({})
      @users = User.all.order("name")
    end
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @current_user = @user
      session[:user] = @user.id

      flash[:notice] =  "Successfully Signed up"
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:notice] = "User successfully updated"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    expire_fragment :controller => "users", :action => "index"
    flash[:notice] = "User successfully destroyed"
    redirect_to users_path
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def confirm_user_owns_record
    return if is_admin?
    if @user.id != @current_user.id
      redirect_to user_path(@current_user)
    end
  end

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :profile,
                                 :is_admin
                                )
  end
end
