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

    @arr = Array.new
    @count_flag = 0
    @fav_book.each do |fav|
      @book = Book.where(bookinfos_id: fav.books_id)
      @book.each do |flag|
        if flag.books_flag == 0 && flag.members_id != @mid then
          @count_flag += 1
        end
      end
      if Book.exists?(bookinfos_id: fav.books_id) && @count_flag >= 1 then
        @arr.push(1)
      else
        @arr.push(0)
      end
    end
  end

  def delete
    @fav_book = MembersBooks.find(params[:id])
    @fav_book.delete()
    redirect_to({action: :index}, notice: 'delete')
  end
end
