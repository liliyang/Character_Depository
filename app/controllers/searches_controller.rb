class SearchesController < ApplicationController
  
  include SearchesHelper
  
  # Simple search form
  def index
    @characters = search(params[:search])
    @characters.sort! { |a,b| a.name <=> b.name }
  end
  
  # Advanced search form
  def new
    
  end
  
  # Show advanced search results
  def show
    
  end
  
end
