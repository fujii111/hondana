# coding: utf-8

class TradeController < ApplicationController
  def index
  end
  def select
    @books = Book.find_by_sql("SELECT * FROM members ,books WHERE books_flag = 0 AND bookinfos_id = 1 AND members.id = books.members_id")
  end
  def confirm
    @books = Book.find_by_sql("SELECT * FROM members ,books, bookinfos WHERE members.id = 1 AND books.bookinfos_id = 1 AND bookinfos.id = 1 AND books.id = 1")
  end
  def details
    @books = Book.find_by_sql("SELECT * FROM members ,books, bookinfos WHERE members.id = 1 AND books.bookinfos_id = 1 AND bookinfos.id = 1 AND books.id = 1")
  end
  def comp
    @books = Book.find_by_sql("SELECT * FROM members ,books WHERE books_flag = 0 AND bookinfos_id = 1 AND members.id = books.members_id")
  end
end
