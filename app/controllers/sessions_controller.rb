class SessionsController < ApplicationController
  
  # GET /signin
  def new

  end

  # POST /sessions
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      render action: 'new'
      flash.now[:alert] = 'Invalid email/password combination!'
    end
  end

  # DELETE /signout
  def destroy

  end
  
end
