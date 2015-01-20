class CollectionController < ApplicationController

  @id = nil
  @books = nil

  def index
    if session[:id].nil? then
      redirect_to "/signin/"
    else
      @id = session[:id]
      @books = Books.find_by(members_id:@id)
    end
  end
  def confirm
  end
  def comp
  end
  def aaa_edit
  end
end
