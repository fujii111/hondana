# coding: utf-8
require 'date'

class TradeController < ApplicationController
  def index
    @id = cookies[:id].to_i
    @trade = Trade.find_by_sql(["SELECT * FROM trades WHERE receipt_members = :id OR delivery_members = :id", {:id => @id}])
    @book_data = Array.new
    @book_member = Array.new
    @trd_status = Array.new
    @state_color = Array.new
    @state_name = Array.new
    @fore_id = Array.new
    @trade.each do |data|
      @book_data.push(Bookinfo.find_by_sql(["SELECT * FROM bookinfos JOIN books, trades ON bookinfos.id = books.bookinfos_id AND books.bookinfos_id = trades.books_id WHERE books.id = :bid", {:bid => data.books_id}]))
      if data.delivery_members == @id then
        @state_color.push("sendding")
        @state_name.push("送り先：　")
        @fore_id.push(data.receipt_members)
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
        @state_color.push("getting")
        @state_name.push("送り主：　")
        @fore_id.push(data.delivery_members)
        @book_member.push(Member.find(data.delivery_members))
        case data.trades_flag when 0
          @trd_status.push("交換キャンセル")
        when 1
          @trd_status.push("交換受理待ち")
        when 2
          @trd_status.push("送付準備中")
        when 3
          @trd_status.push("受取待ち")
        when 4
          @trd_status.push("交換完了")
        end
      end
    end
  end

  def select
    @id = cookies[:id].to_i #自分の蔵書を表示させないためのフラグ
    @bookinfo_id = Bookinfo.find(params[:id])
    @books = Book.find_by_sql(["SELECT * FROM members ,books WHERE books_flag = 0 AND members.quit = 0 AND bookinfos_id = :idb AND members.id = books.members_id AND members.id != :id",{:idb => @bookinfo_id, :id => @id}])
    @book_count = @books.length
  end

  def confirm
    @id = cookies[:id].to_i #自分の蔵書を表示させないためのフラグ
    @books = Book.find_by_sql(["SELECT members.nickname, bookinfos.name, bookinfos.author, books.state, books.height, bookinfos.width, bookinfos.thinck, books.weight, books.sunburn, books.scar, books.graffiti, books.broken, books.obi, books.smoke, books.pet, books.mold, books.remarks, books.id ,books.members_id FROM books JOIN members, bookinfos ON books.bookinfos_id = bookinfos.id AND books.members_id = members.id WHERE books.books_flag = 0 AND members.quit = 0 AND members.id = books.members_id AND books.id = :idb AND bookinfos.id = books.bookinfos_id AND books.members_id != :id ",{:idb => params[:idb], :id => @id}])
    @nickname = Member.find(@books[0].members_id)
  end

  def details
    @books = Book.find_by_sql(["SELECT * FROM books JOIN members, bookinfos ON books.bookinfos_id = bookinfos.id AND books.members_id = members.id WHERE books.books_flag = 0 AND members.quit = 0 AND books.id = :idb AND bookinfos.id = books.bookinfos_id",{:idb => params[:idb]}])
  end

  def trade_data
    @id = cookies[:id].to_i
    @t_id = params[:id]
    @trades = Trade.find(@t_id)
    @member_r = Member.find(@trades.receipt_members)
    @member_d = Member.find(@trades.delivery_members)
    @booksfind = Book.find(@trades.books_id)
    @bookinfos = Bookinfo.find(@booksfind.bookinfos_id)
    @trades_flag = Trade.find(@trades.books_id)
    @books = Book.find_by_sql(["SELECT * FROM books JOIN members, bookinfos ON books.bookinfos_id = bookinfos.id AND books.members_id = members.id WHERE members.quit = 0 AND members.id = books.members_id AND books.id = :id AND bookinfos.id = books.bookinfos_id",{:id => @t_id}])
  end

 #リファラ(どこのディレクトリから来たか)の取得
  def get_ref
    @ref = request.referer
    if @ref != nil then
      @refs = @ref.split("/")
      @refs = @refs[@refs.length - 1]
    end
  end

  def comp
    @id = cookies[:id].to_i
    @member = Member.find(@id)
    @books_id = params[:idb]
    @bookfind = Book.find(@books_id)
    @time = Time.now
    if @member.point != 0 then  #pointが0だった場合エラー画面に飛ばす
      if @bookfind.books_flag == 0 then #compを再読み込みした時に追加でtradeがクリエイトされないようにする
         #ブックフラグを1にセットして、tradeをクリエイト

         @bookfind.books_flag = 1
         success = @bookfind.save
         render text: success

         @books = Book.find_by_sql(["SELECT bookinfos.name, members.id, members.nickname, members.mail_address FROM books JOIN members, bookinfos ON books.bookinfos_id = bookinfos.id AND books.members_id = members.id WHERE members.quit = 0 AND members.id = books.members_id AND books.id = :idb AND bookinfos.id = books.bookinfos_id",{:idb => params[:idb]}])
         @receipt_id = @books[0].id
         @delivery_id = cookies[:id].to_i
         Trade.create(request_date: @time, receipt_date: "", send_date: "", complete_date: "", receipt_members: @receipt_id, delivery_members: @delivery_id, books_id: @books_id, carriers_id: "1", tracking_number: "000000000000", trades_flag: "1")
         # # #告知      # @bookinfos = Bookinfo.find_by(id: @bookfind.bookinfos_id)
         # @recept_member = Member.find_by(id: @receipt_id)
         # @delivery_member = Member.find_by(id: @delivery_id)
         # notice = Notice.new(:members_id => @recept_member.id, :title => @delivery_member.nickname + 'さんから交換申請があります',
            # :content => '
            # 申請された蔵書：『' + @bookinfos.name + '』
            # 申請相手：' + @delivery_member.nickname + 'さん
            # 交換詳細ページへ移動し、交換申請の確認をお願いします。
            # http://localhost:3000/trade/' + @bookfind.id.to_s + '/trade_data.html')
         # notice.save
#
         # notice2 = Notice.new(:members_id => @delivery_member.id, :title => @recept_member.nickname + 'さんに交換申請しました。',
          # :content => '
          # 申請した蔵書：『' + @bookinfos.name + '』
          # 申請相手：' + @recept_member.nickname + 'さん
          # '+ @recept_member.nickname + 'さんからの連絡をおまちください。')
       # notice2.save
      else
        @books = Book.find_by_sql(["SELECT bookinfos.name, members.id, members.nickname, members.mail_address  FROM books JOIN members, bookinfos ON books.bookinfos_id = bookinfos.id AND books.members_id = members.id WHERE members.quit = 0 AND members.id = books.members_id AND books.id = :idb AND bookinfos.id = books.bookinfos_id",{:idb => params[:idb]}])
      end
     else
      @books = Book.find_by_sql(["SELECT bookinfos.name, members.id, members.nickname, members.mail_address  FROM books JOIN members, bookinfos ON books.bookinfos_id = bookinfos.id AND books.members_id = members.id WHERE members.quit = 0 AND members.id = books.members_id AND books.id = :idb AND bookinfos.id = books.bookinfos_id",{:idb => params[:idb]}])
     end
  end

  def update2
    #@id = cookies[:id].to_i
    @t_id = params[:tid]
    @tradefind = Trade.find(@t_id)
    @tradefind.trades_flag = 2
    @tradefind.save
    @link = "/trade/trade_data/" + @t_id
    redirect_to @link
  end

  def update3
    #@id = cookies[:id].to_i
    @t_id = params[:tid]
    @tradefind = Trade.find(@t_id)
    @tradefind.trades_flag = 3
    @tradefind.save
    @link = "/trade/trade_data/" + @t_id
    redirect_to @link
  end

  def update4
    @id = cookies[:id].to_i
    @t_id = params[:tid]
    @trades = Trade.find(@t_id)
    @member_r = Member.find(@trades.receipt_members)
    @member_d = Member.find(@trades.delivery_members)
    @trades.trades_flag = 4
    @trades.save
    if @trades.trades_flag != 4 then #update4を不正に読み込んだ時の処理
      #なにもしない
    else
      @member_r.update_attribute(:point,@member_r.point - 1)
      @member_d.update_attribute(:point,@member_d.point + 1)
    end
    @link = "/trade/trade_data/" + @t_id
    redirect_to @link
  end
end