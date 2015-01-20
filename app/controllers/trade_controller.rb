# coding: utf-8

class TradeController < ApplicationController
  def index
    @id = session[:id]
    @trade = Trade.find_by_sql(["SELECT * FROM trades WHERE receipt_members = :id OR delivery_members = :id", {:id => @id}])
    @book_data = Array.new
    @book_member = Array.new
    @trd_status = Array.new
    @trade.each do |data|
      @book_data.push(Bookinfo.find_by_sql(["SELECT * FROM bookinfos JOIN books, trades ON bookinfos.id = books.bookinfos_id AND books.bookinfos_id = trades.books_id WHERE books.bookinfos_id = :bid", {:bid => data.books_id}]))
      if data.delivery_members == @id then
        @book_member.push(Member.find(data.receipt_members))
        case data.trades_flag when 0
          @trd_status.push("交換キャンセル")
        when 1
          @trd_status.push("交換申請中")
        when 2
          @trd_status.push("送付準備中")
        when 3
          @trd_status.push("相手の受取待ち")
        when 4
          @trd_status.push("交換完了")
        end
      elsif data.receipt_members == @id then
        @book_member.push(Member.find(data.delivery_members))
        case data.trades_flag when 0
          @trd_status.push("交換キャンセル")
        when 1
          @trd_status.push("交換受理待ち")
        when 2
          @trd_status.push("送付準備中")
        when 3
          @trd_status.push("送付完了 受取待ち")
        when 4
          @trd_status.push("交換完了")
        end
      end
    end
  end

  def select
    @books = Book.find_by_sql("SELECT * FROM members ,books WHERE books_flag = 0 AND members.quit = 0 AND bookinfos_id = 1 AND members.id = books.members_id AND members.quit = 0")
  end
  def confirm
    @books = Book.find_by_sql("SELECT * FROM members ,books, bookinfos WHERE members.id = 1 AND books.bookinfos_id = 1 AND bookinfos.id = 1 AND books.id = 1")
  end
  def details
    @books = Book.find_by_sql(["SELECT * FROM members ,books, bookinfos WHERE members.id = :mid AND books.bookinfos_id = :bid AND bookinfos.id = :bid AND books.id = :bid",{:mid => session[:id], :bid => params[:id]}])
  end
  def comp
    @books = Book.find_by_sql("SELECT * FROM members ,books WHERE books_flag = 0 AND bookinfos_id = 1 AND members.id = books.members_id")
  end
end
