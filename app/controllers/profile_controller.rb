class ProfileController < ApplicationController
  #require 'digest/sha1'

  $id = 1
  $member = Member.includes(:Favorite_authors).where(:members_id => $id).references(:Favorite_authors)

  def index
    get_member($id)

  end

  def edit
    get_member($id)
    get_ref
    if @refs == "profile" then
      session[:prof] = params[:prof]
    else
      redirect_to :action => "index"
    end
  end

  def confirm
    @get = params[:prof]
    get_ref
    if @refs == "edit" then
      session[:prof] = params[:prof]
    else
      redirect_to :action => "index"
    end
  end

  def comp
    get_member($id)
    get_ref
    @birth = session[:prof][:birth_year] + session[:prof][:birth_month] + session[:prof][:birth_day]

    if @refs == "confirm" then
      $member.update(name: session[:prof][:name],kana: session[:prof][:name_kana],nickname: session[:prof][:nickname],mail_address: session[:prof][:mail], address: session[:prof][:address], birthday:@birth)

      if session[:prof][:fav_author_0] != nil then
        $member.favorite_authors.update(id: 1, members_id: $id, author: session[:prof][:fav_author_0], sort: 1,)
        if session[:prof][:fav_author_1] != nil then
          $member.favorite_authors.update(id: 2, members_id: $id, author: session[:prof][:fav_author_1], sort: 2,)
          if session[:prof][:fav_author_2] != nil then
            $member.favorite_authors.update(id: 3, members_id: $id, author: session[:prof][:fav_author_2], sort: 3,)
          end
        end
      end

      session[:prof] = nil
    end
    redirect_to :action => "index"
    #@genres.update()
    #@prof = prof
    #postでもらってきたパスワードをハッシュ化して、Member.passwordと比較
    #一致すればパスワードは変更されていない
    #一致しなければ新規パスワードとしてハッシュ化、保存される
    #if @member.password == Digest::SHA1.hexdigest(@prof.pass) then
    #else
    #end

  end

  def get_ref
    @ref = request.referer
    @refs = @ref.split("/")
    @refs = @refs[@refs.length - 1]
  end

  def get_member(numid)
    $member = Member.find(numid)
    @genres = Bookgenre.all
    @genre_name = Bookgenre.find_by_sql(['select members_genres.members_id,members_genres.bookgenres_id,bookgenres.name from bookgenres join members_genres on members_genres.bookgenres_id=bookgenres.id where members_genres.members_id=:numid', {:numid=> numid}])
  end
end
