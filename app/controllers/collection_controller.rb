class CollectionController < ApplicationController

  @id = nil
  @book = nil
  @books = nil

  def index
    if session[:id].nil? then
      redirect_to "/signin/"
    else
      @id = session[:id]
      @books = Book.find_by_sql(["select books.id, books.state, books.remarks, books.books_flag, bookinfos.name, bookinfos.author, bookinfos.publisher, bookinfos.picture, books.updated_at from books join bookinfos on books.bookinfos_id = bookinfos.id where books.members_id = :id", {:id => @id}])
    end
  end
  def edit
    get_ref
    if (@path[:controller] == 'collection' && @path[:action] == 'index') || (@path[:controller] == 'collection' && @path[:action] == 'confirm') then
      @b_id = params[:id]
      @b_details = Book.find(@b_id)
      @b_info_detail = Bookinfo.find(@b_details.bookinfos_id)
    else
      redirect_to(action: :index)
    end

  end
  def confirm
    get_ref
    if (@path[:controller] == 'collection' && @path[:action] == 'edit') then
      session[:prof] = params[:prof]
      @b_details = Book.find(params[:prof][:books_id])
      @b_info_detail = Bookinfo.find(@b_details.bookinfos_id)
    else
      redirect_to(action: :index)
    end
  end

  def comp
      redirect_to({action: :index}, notice: 'complete')
  end

  def delete
    get_ref
    if (@path[:controller] == 'collection' && @path[:action] == 'edit') then
      @books = Book.find(params[:id])
      @books.update(books_flag: 2)
    else
      redirect_to(action: :index)
    end
  end

  def get_ref
    @path = Rails.application.routes.recognize_path(request.referer)
  end
end
