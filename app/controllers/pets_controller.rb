class PetsController < ApplicationController
  before_action :set_character
  before_action :set_pet, only: [:edit, :update, :destroy]

  # GET /characters/1/dragon/new
  def new
    @pet = @character.pets.new
  end

  # GET /characters/1/dragon/1/edit
  def edit
  end

  # POST /characters
  def create
    @pet = @character.pets.new(pet_params)

    if @pet.save
      redirect_to @character, notice: 'The pet was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    if @pet.update(pet_params)
      redirect_to @character, notice: 'The pet was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @pet.destroy
    redirect_to @character
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:character_id])
    end

    def set_pet
      @pet = @character.pets.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_params
      params.require(:pet).permit(:name, :pet_type, :description, :personality)
    end
    
end
