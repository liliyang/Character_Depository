class CharactersController < ApplicationController
  
  include CheckUser
  
  before_action :set_character, only: [:show, :edit, :update, :destroy, :set_status, :approve_character]
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy, :set_status]
  before_action :correct_user, only: [:edit, :update, :destroy, :set_status]
  before_action :admin_user, only: [:approve_character]

  # GET /characters
  # GET /characters.json
  def index
    if params[:character_type]
      @characters = Character.display.where(character_type: params[:character_type]).includes(:dragon)
    else
      @characters = Character.display.includes(:dragon)
    end
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(character_params)
    @character.user_id = current_user.id
    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Character was successfully created.' }
        format.json { render action: 'show', status: :created, location: @character }
      else
        format.html { render action: 'new' }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: 'Character was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url }
      format.json { head :no_content }
    end
  end
  
  def new_created
    @characters = Character.recent
    
  end
  
  def new_updated
    @characters = Character.updated
  end
  
  def set_status
    @character.active = !@character.active
    if @character.save
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user), alert: "Error! Action failed!"
    end
  end
  
  def approve_character
    @character.approved = true
    if @character.save
      redirect_to users_path
    else
      redirect_to users_path, alert: "Error! Failed to Approve!"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find_by(name: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:name, :pronunciation, :character_type, :craft, :rank, :age, :gender, :location, :description, :personality, :history)
    end
    
end
