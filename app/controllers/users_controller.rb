class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy, :set_password]
  before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy, :set_password]
  before_action :correct_user, only: [:edit, :update, :destroy, :set_password]
  before_action :admin_user, only: [:index]
  before_action :check_update_password, only: [:update]

  # GET /users
  def index
    @users = User.all
    @characters = Character.where(approved: false).order("updated_at ASC").includes(:dragon)
  end

  # GET /users/1
  def show
    @characters = @user.characters
    respond_to do |format|
      format.html do
        if is_current_user?(@user)
          render :mypage
        else
          @characters = Character.display.where(user: @user)
        end
      end
      format.js
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      if @user.updating_password
        render action: 'set_password'
      else
        render action: 'edit'
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url
  end
  
  def set_password
    unless session[:authenticated]
      redirect_to authenticate_path
    end
    session[:authenticated] = nil
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(username: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
    
    def check_update_password
      if params[:user][:password]
        @user.updating_password = true
      end
    end
    
end
