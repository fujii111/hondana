class CollectionController < ApplicationController

  @id = nil
  @book = nil
  @books = nil

  def index
    if session[:id].nil? then
      redirect_to "/signin/"
    else
      @id = session[:id]
      @books = Book.find_by_sql(["select books.id, books.state, books.remarks, bookinfos.name, bookinfos.author, bookinfos.publisher, bookinfos.picture, books.updated_at from books join bookinfos on books.bookinfos_id = bookinfos.id where books.members_id = :id", {:id => @id}])
    end
  end
  def edit
    @b_id = params[:id]
    @b_details = Book.find(@b_id)
    @b_info_detail = Bookinfo.find(@b_details.bookinfos_id)

  end
  def confirm
  end
  def comp
  end
end
