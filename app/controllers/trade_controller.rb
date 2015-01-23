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
    #@members_id = Member.find(params[:id])
    @bookinfo_id = Bookinfo.find(params[:id])
    @books = Book.find_by_sql(["SELECT * FROM members ,books WHERE books_flag = 0 AND members.quit = 0 AND bookinfos_id = :id AND members.id = books.members_id",{:id => @bookinfo_id}])
    @book_count = @books.length
  end

  def confirm
    @books = Book.find_by_sql(["SELECT * FROM books JOIN members, bookinfos ON books.bookinfos_id = bookinfos.id AND books.members_id = members.id WHERE books.books_flag = 0 AND members.quit = 0 AND members.id = :idm AND bookinfos.id = :idb AND bookinfos.id = books.bookinfos_id",{:idb => params[:idb] , :idm => params[:idm]}])
    @nickname = Member.find(params[:idm])
  end

  def details
    @books = Book.find_by_sql(["SELECT * FROM books JOIN members, bookinfos ON books.bookinfos_id = bookinfos.id AND books.members_id = members.id WHERE books.books_flag = 0 AND members.quit = 0 AND members.id = :idm AND bookinfos.id = :idb AND bookinfos.id = books.bookinfos_id",{:idb => params[:idb] , :idm => params[:idm]}])
  end
#--------未完成ゾーン--------------
 #リファラ(どこのディレクトリから来たか)の取得
  def get_ref
    @ref = request.referer
    if @ref != nil then
      @refs = @ref.split("/")
      @refs = @refs[@refs.length - 1]
    end
  end

  def comp
    #@members = Member.find(params[:idm])
    #bookfind = Book.find(params[:idb])
    #bookfind.update_attribute(:books_flag, 1)
    @books = Book.find_by_sql(["SELECT * FROM books JOIN members, bookinfos ON books.bookinfos_id = bookinfos.id AND books.members_id = members.id WHERE books.books_flag = 1 AND members.quit = 0 AND members.id = :idm AND bookinfos.id = :idb AND bookinfos.id = books.bookinfos_id",{:idb => params[:idb] , :idm => params[:idm]}])
  end
#----------------------------------
end
