class AccountController < ApplicationController
  protect_from_forgery with: :exception
  include SessionsHelper

  $mid = nil
  #$member = nil
  $fav_book = nil
  def index
    $mid = session[:id]
    #$member = Member.find($mid)
    #$fav_book =MembersBooks.find_by(members_id:$mid)

  end
end
