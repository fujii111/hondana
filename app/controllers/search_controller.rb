class SearchController < ApplicationController
  def details
    
  end
  
  def index
    @keyword = params[:keyword]
    if @keyword.present?
      Amazon::Ecs.debug = true
      @res = Amazon::Ecs.item_search(params[:keyword], 
          :search_index => 'All', :response_group => 'Medium')
    else
      return
    end
   end
end
