class RelationshipsController < ApplicationController
  
  before_action :set_character
  before_action :set_relationship, only: [:update, :destroy]


  # GET /relationships/new
  def new
    if params[:search]
      @characters = search_character_name(params[:search]).where.not(id: @character.id)
    else
      @characters = Character.display.where.not(id: @character.id)
    end
  end

  # GET /relationships/1/edit
  def edit
    @relationships = @character.relationships
  end

  # POST /relationships
  # POST /relationships.json
  def create
    @relationship = @character.relationships.build(relative_id: params[:relative_id], relation_type: params[:relation_type])
    if @relationship.save
      redirect_to @character, notice: 'Relationship was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /relationships/1
  # PATCH/PUT /relationships/1.json
  def update
    if @relationship.update(relationship_params)
      redirect_to edit_character_relationships_path(@character.name), notice: 'Relationship was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /relationships/1
  # DELETE /relationships/1.json
  def destroy
    @relationship.destroy
    redirect_to edit_character_relationships_path(@character.name), notice: 'That relationship has been removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relationship_params
      params.require(:relationship).permit(:character_id, :relative_id, :relation_type)
    end
end
