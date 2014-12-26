# coding: utf-8

class TradeController < ApplicationController
  def index
  end
  def select
    @books = Book.all
  end
  def confirm
    @books = Book.all
  end
  def comp
  end
  def details
    @books = Book.all
  end
end
