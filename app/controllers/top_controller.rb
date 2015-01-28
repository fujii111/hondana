class TopController < ApplicationController

  def index
     session[:entry_members] = nil
     session[:entry_books] = nil
  end

end
