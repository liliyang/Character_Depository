class DragonsController < ApplicationController
  before_action :set_character
  before_action :set_dragon, only: [:edit, :update, :destroy]
  
  # GET /characters/1/dragon/new
  def new
    @dragon = @character.build_dragon
  end

  # GET /characters/1/dragon/1/edit
  def edit
  end
  
  # POST /characters
  def create
    @dragon = @character.create_dragon(dragon_params)

    if @dragon.save
      redirect_to @character, notice: 'Dragon was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    if @dragon.update(dragon_params)
      redirect_to @character, notice: 'Dragon was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @dragon.destroy
    redirect_to @character
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find_by(name: params[:character_id])
    end
    
    def set_dragon
      @dragon = @character.dragon
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def dragon_params
      params.require(:dragon).permit(:name, :age, :color, :description, :personality)
    end
    
end
