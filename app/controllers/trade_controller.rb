# coding: utf-8

class TradeController < ApplicationController
  def index
  end

  def select
    # @id = Book.find(params[:id])
    # render 'trade/confirm'
    @books = Book.find_by_sql("SELECT * FROM members ,books WHERE books_flag = 0 AND members.quit = 0 AND bookinfos_id = 1 AND members.id = books.members_id AND members.quit = 0")
  end

  def confirm
    #@books = Book.find(params[:id])
    #render 'trade/confirm'
    @books = Book.find_by_sql("SELECT * FROM members ,books, bookinfos WHERE members.id = 1 AND books.bookinfos_id = 1 AND bookinfos.id = 1 AND books.id = 1")
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
