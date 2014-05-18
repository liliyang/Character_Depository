class EggsController < ApplicationController
  
  before_action :set_clutch
  before_action :set_egg, only: [:edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]

  # GET /eggs/new
  def new
    @egg = @clutch.eggs.new
  end

  # GET /eggs/1/edit
  def edit
  end

  # POST /eggs
  # POST /eggs.json
  def create
    @egg = @clutch.eggs.new(egg_params)

    if @egg.save
      redirect_to @clutch, notice: 'Egg was successfully created.'
    else
      render action: 'new'
    end

  end

  # PATCH/PUT /eggs/1
  # PATCH/PUT /eggs/1.json
  def update
    if @egg.update(egg_params)
      redirect_to @clutch, notice: 'Egg was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /eggs/1
  # DELETE /eggs/1.json
  def destroy
    @egg.destroy
    redirect_to @clutch

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_egg
      @egg = Egg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def egg_params
      params.require(:egg).permit(:name, :description, :creature_color, :creature_appearance, :creature_personality, :character, :inspiration)
    end
end
