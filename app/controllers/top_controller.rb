class TopController < ApplicationController

  def index
     session[:entry_members] = nil
     session[:entry_books] = nil
     #cookies.delete(:entry_members)
     #cookies.delete(:entry_mbooks)
     #cookies.delete:entry_members
     #cookies.delete:entry_books
  end


end
