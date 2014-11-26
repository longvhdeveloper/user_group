class UsersController < ApplicationController
  before_filter :set_user, except: [:index, :new, :create]
  def index
    @users = User.all.order("name")
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
    flash[:notice] = "User successfully destroyed"
    redirect_to users_path
  end
  
  private
  def set_user
    @user = User.find(params[:id])
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
