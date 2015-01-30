class AccountController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper

  @mid = nil
  @member = nil
  @fav_book = nil
  def index
    @mid = cookies[:id].to_i
    @member = Member.find(@mid)

    #BooksとBookinfosを結合
    @push_book = Book.find_by_sql(["select * from books join bookinfos on books.bookinfos_id = bookinfos.id where books.books_flag = '0' and books.members_id =:id",{:id => @mid}])
    #件数表示のためのカウント
    @count = @push_book.length
    #MembersBooksとBookinfosを結合
    @fav_book =MembersBooks.find_by_sql(["select * from members_books join bookinfos on members_books.books_id = bookinfos.id where members_books.members_id =:id order by sort",{:id => @mid}])

    #在庫表示のフラグ格納用配列
    @arr = Array.new
    #お気に入りの書籍をeachで1つずつ抽出
    @fav_book.each do |fav|
      #count_flagをお気に入りの書籍ごとにリセット
      @count_flag = 0
      #書籍IDが一致する蔵書を全抽出
      @book = Book.where(bookinfos_id: fav.books_id)
      #蔵書の全抽出
      @book.each do |flag|
        #books_flagが0(交換手続きに入っていない)なおかつmembers_idが自分じゃない
        if flag.books_flag == 0 && flag.members_id != @mid then
          @count_flag += 1
        end
      end
      #蔵書が存在する、かつ自分以外の交換可能な蔵書がある
      if Book.exists?(bookinfos_id: fav.books_id) == 1 && @count_flag >= 1 then
        @arr.push(1)#フラグを1に
      else
        @arr.push(0)#フラグを0に
      end
    end
  end

  def delete
    @fav_book = MembersBooks.find(params[:id])
    @fav_book.delete()
    redirect_to({action: :index}, notice: 'delete')
  end
end
