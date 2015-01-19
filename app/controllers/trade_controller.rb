# coding: utf-8

class TradeController < ApplicationController
  def index
  end

  def select
    # @id = Bookinfo.new(params[:id])
    # render 'trade/select'
    @bookinfo_id = Bookinfo.find(params[:id])
    @books = Book.find_by_sql(["SELECT * FROM members ,books WHERE books_flag = 0 AND members.quit = 0 AND bookinfos_id = :id AND members.id = books.members_id AND members.quit = 0",{:id => @bookinfo_id}])
    @book_count = @books.length
  end

  def confirm
    #@books = Book.find(params[:id])
    #render 'trade/confirm'
    @bookinfoid = Bookinfo.find(params[:id])
    @books = Book.find_by_sql(["SELECT * FROM members ,books, bookinfos WHERE members.id = 1 AND books.bookinfos_id = 1 AND bookinfos.id = 1 AND books.id = 1",{:id => @bookinfoid}])
  end

  def details
    # @books = Book.find(params[:id])
    # render 'trade/details'
    @books = Book.find_by_sql("SELECT * FROM members ,books, bookinfos WHERE members.id = 1 AND books.bookinfos_id = 1 AND bookinfos.id = 1 AND books.id = 1")
  end

  def comp
    @books = Book.find_by_sql("SELECT * FROM members ,books WHERE books_flag = 0 AND bookinfos_id = 1 AND members.id = books.members_id")
  end
end
