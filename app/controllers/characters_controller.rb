class CharactersController < ApplicationController
  
  before_action :set_character, only: [:show, :edit, :update, :destroy, :set_status, :approve_character, :upload_picture]
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy, :set_status]
  before_action :correct_user, only: [:edit, :update, :destroy, :set_status, :upload_picture]
  before_action :admin_user, only: [:approve_character]
  
  helper_method :sort_column, :sort_direction
  
  # GET /characters
  # GET /characters.json
  def index
    if params[:character_type]
      @characters = Character.display.where(character_type: params[:character_type]).order(sort_column + " " + sort_direction).includes(:dragon)
    else
      @characters = Character.display.order(sort_column + " " + sort_direction).includes(:dragon)
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
    if params[:preview_button] || !@character.save
      render action: 'new'
    else
      UserMailer.character_confirmation(@character).deliver
      redirect_to @character, notice: 'Character was successfully created.'
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    if @character.update(character_params)
      redirect_to @character, notice: 'Character was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    redirect_to user_path(@character.user)
  end
  
  def new_created
    @characters = Character.display.recent.order(sort_column + " " + sort_direction)
  end
  
  def new_updated
    @characters = Character.display.updated.order(sort_column + " " + sort_direction)
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
    @character.approved = !@character.approved
    if @character.save
      UserMailer.character_approved(@character).deliver
      redirect_to users_path
    else
      redirect_to users_path, alert: "Error! Failed to Approve!"
    end
  end
  
  def upload_picture
    if params[:picture]
      upload!
      if @character.save
        redirect_to upload_picture_path(@character), notice: "Image successfully uploaded!"
      else
        redirect_to upload_picture_path(@character), alert: "Error! Failed to Upload Image"
      end
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find_by(name: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:category, :name, :pronunciation, :age, :character_type, :rank, :gender, :preference, :location, :description, :personality, :history, :abilities, :dragon_preference, :dragon_names, :craft, :craft_rank, :craft_specialty, :craft_abilities, :hold, :hold_size)
    end
    
    def upload!
      uploaded_io = params[:picture]
      if uploaded_io
        file = "character_#{@character.id}.jpg"
        AWS::S3::S3Object.store(file, uploaded_io.read, ENV["AWS_BUCKET"], :access => :public_read)
        @character.picture = "https://s3.amazonaws.com/#{ENV["AWS_BUCKET"]}/character_#{@character.id}.jpg"
      end
    end
    
    def sort_column
      Character.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
    
end
