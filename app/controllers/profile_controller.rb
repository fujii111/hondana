class ProfileController < ApplicationController
  #require 'digest/sha1'

  $id = 1
  $member = Member.includes(:Favorite_authors).where(:members_id => $id).references(:Favorite_authors)

  def index
    $member = Member.find($id)
    @genres = Bookgenre.find_by_sql('select members_genres.members_id,members_genres.bookgenres_id,bookgenres.name from bookgenres join members_genres on members_genres.bookgenres_id=bookgenres.id where  members_genres.members_id=1')
    #@fav_genres = MembersGenre.find_by(members_id: $id)
    #@genres = MembersGenre.joins(:bookgenres).where(id: @fav_genres.id)
  end

  def edit
    $member = Member.find($id)
    @genres = Bookgenre.find_by_sql('select members_genres.members_id,members_genres.bookgenres_id,bookgenres.name from bookgenres join members_genres on members_genres.bookgenres_id=bookgenres.id where  members_genres.members_id=1')
  end

  def confirm

  end

  def comp
    #@prof = prof
    #postでもらってきたパスワードをハッシュ化して、Member.passwordと比較
    #一致すればパスワードは変更されていない
    #一致しなければ新規パスワードとしてハッシュ化、保存される
    #if @member.password == Digest::SHA1.hexdigest(@prof.pass) then
    #else
    #end
  end
end
