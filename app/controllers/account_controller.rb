class AccountController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper

  @mid = nil
  @member = nil
  @fav_book = nil
  def index
    @mid = session[:id]
    @member = Member.find(@mid)
    #MembersBooksとBookinfosを結合

    #BooksとBookinfosを結合
    @push_book = Book.find_by_sql(["select * from books join bookinfos on books.bookinfos_id = bookinfos.id where books.books_flag = '0' and books.members_id =:id",{:id => @mid}])
    @count = @push_book.length
    #MembersBooksとBookinfosを結合
    @fav_book =MembersBooks.find_by_sql(["select * from members_books join bookinfos on members_books.books_id = bookinfos.id where members_books.members_id =:id",{:id => @mid}])

  end
end
