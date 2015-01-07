# coding: utf-8

class TradeController < ApplicationController
  def index
  end
  def select
    @books = Book.all
    #booksのmembers_idからmemberのlogin_idを取得
    @owner = Member.find_by_sql("SELECT login_id FROM members ,books WHERE members.id = books.members_id")
  end
  def confirm

  end
  def comp

  end
  def details

  end
end
