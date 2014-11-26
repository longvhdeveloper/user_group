class SessionsController < ApplicationController
  def new

  end

  def create
    @current_user = User.authenticate(params[:email], params[:password])
    puts @current_user
    if @current_user
      session[:user] = @current_user.id
      flash[:notice] = 'Logged in successfully'
      redirect_to user_path(@current_user)
    else
      flash[:notice] = "Username or password not correct."
      render :new
    end
  end

  def destroy
    reset_session

    flash[:notice] = "Logged out successfully"
    redirect_to new_session_path
  end
end
