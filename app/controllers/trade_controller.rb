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
    @members_id = Member.find(params[:id])
    @bookinfo_id = Bookinfo.find(params[:id])
    @books = Book.find_by_sql(["SELECT * FROM members ,books WHERE books_flag = 0 AND members.quit = 0 AND bookinfos_id = :id AND members.id = books.members_id",{:id => @bookinfo_id}])
    @book_count = @books.length
  end

#--------未完成ゾーン--------------
  def get_ref#リファラの取得
    @ref = request.referer
    if @ref != nil then
      @refs = @ref.split("/")
      @refs = @refs[@refs.length - 1]
    end
  end

  def confirm
    @books = Book.find_by_sql(["SELECT * FROM books JOIN members, bookinfos ON books.bookinfos_id = bookinfos.id AND books.members_id = members.id WHERE books.books_flag = 0 AND members.quit = 0 AND members.id = :idm AND bookinfos.id = :idb AND bookinfos.id = books.bookinfos_id",{:idb => params[:idb] , :idm => params[:idm]}])
    @nickname = Member.find(params[:idm])
  end

  def details
    @books = Book.find_by_sql(["SELECT * FROM books JOIN members, bookinfos ON books.bookinfos_id = bookinfos.id AND books.members_id = members.id WHERE books.books_flag = 0 AND members.quit = 0 AND members.id = :idm AND bookinfos.id = :idb AND bookinfos.id = books.bookinfos_id",{:idb => params[:idb] , :idm => params[:idm]}])
    #@members_id = Member.find(params[:idm])
    #@books_id = Book.find(params[:idb])
    #@bookinfos_id = Bookinfo.find(params[:idbi])
    #@books = Book.find_by_sql(["SELECT * FROM members ,books ,bookinfos WHERE books_flag = 0 AND members.quit = 0 AND books.id = :idb AND members.id = :idm AND bookinfos.id = :idbi ",{:idb => @books_id , :idm => @members_id , :idbi => @bookinfos_id}])
    #@books = Book.find_by_sql(["SELECT * FROM members ,books, bookinfos WHERE books_flag = 0 AND members.quit = 0 AND members.id = :idm AND books.bookinfos_id = 1 AND bookinfos.id = :idbi AND books.id = :idb ", {:idb => @books_id , :idm => @members_id , :idbi => @bookinfos_id}}])
  end

  def books_update
    bookinfo = Bookinfos.find(:idb)
    bookinfo.update_attribute(:books_flag,"1")
  end

  #def trade_create

  #end

  #def get_book(@id)
  #  @book = Member.find(:idb)
  #end


  def comp
  #  get_book(@id)
    @books = Book.find_by_sql(["SELECT * FROM books JOIN members, bookinfos ON books.bookinfos_id = bookinfos.id AND books.members_id = members.id WHERE books.books_flag = 0 AND members.quit = 0 AND members.id = :idm AND bookinfos.id = :idb AND bookinfos.id = books.bookinfos_id",{:idb => params[:idb] , :idm => params[:idm]}])
  #  @book.update(books_flag: 1)
  end
end
