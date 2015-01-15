# coding: utf-8

class TradeController < ApplicationController
  def index
  end
  def select
    @books = Book.find_by_sql("SELECT * FROM members ,books WHERE books_flag = 0 AND members.id = books.members_id")
  end
  def confirm
    @books = Book.all
  end
  def comp
    @books = Book.all
  end
  def details
    @books = Book.all
  end
end
