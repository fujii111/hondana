# coding: utf-8

class TradeController < ApplicationController
  def index
  end
  def select
    # @member = Member.find(params[:id])
    @books = Book.all
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
