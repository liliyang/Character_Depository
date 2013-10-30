class SearchesController < ApplicationController
  
  include SearchesHelper
  
  # Simple search form
  def index
    @characters = search(params[:search])
  end
  
  # Advanced search form
  def new
    
  end
  
  # Show advanced search results
  def show
    
  end
  
end
