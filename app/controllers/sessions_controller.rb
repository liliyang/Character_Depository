class SessionsController < ApplicationController

  
  # GET /signin
  def new

  end
  
  # GET /authenticate
  def edit
    if current_user.authenticate(params[:old_password])
      redirect_to set_password_path(current_user)
      session[:authenticated] = true
    elsif params[:old_password]
      redirect_to authenticate_path, alert: "Invalid password! If you're not #{current_user.username}, please sign in using your own user account."
    end
  end

  # POST /sessions
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:alert] = 'Invalid username/password combination!'
      render action: 'new'
    end
  end

  # DELETE /signout
  def destroy
    sign_out
    redirect_to characters_url
  end
  
end
