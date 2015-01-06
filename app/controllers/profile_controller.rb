class ProfileController < ApplicationController
  #require 'digest/sha1'

  $id = 1
  $member = nil

  def index

    $member = Member.includes(:Favorite_authors).where(:members_id => $id).references(:Favorite_authors)
    get_member($id)
  end

  def edit
    get_member($id)
    get_ref
    if @refs == "profile" then#profile/indexから来てる時だけ処理
      session[:prof] = params[:prof]
    elsif @refs == "confirm" then
    else
      redirect_to :action => "index"
    end
  end

  def confirm
    get_ref
    if @refs == "edit" then#editから来てる時だけ処理
      session[:prof] = params[:prof]

    else
      redirect_to :action => "index"
    end
    get_genre
  end

  def comp
    get_member($id)
    get_ref
    @birth = session[:prof][:birth_year] + session[:prof][:birth_month] + session[:prof][:birth_day]

    if @refs == "confirm" then#confirmから来てる時だけ更新処理

      #profileの更新(パスワードは未着手)
      $member.update(name: session[:prof][:name],kana: session[:prof][:name_kana],nickname: session[:prof][:nickname],mail_address: session[:prof][:mail], address: session[:prof][:address], birthday:@birth)

      #favorite_authorの更新作業
      @arr = [session[:prof][:fav_author_0], session[:prof][:fav_author_1], session[:prof][:fav_author_2]]

      for @num in 0..2 do
        if !!$member.favorite_authors.find_by(members_id:$id, sort:@num + 1) then#favorite_authorがnilじゃないことを確認
          if @arr[@num] != '' then#sessionの:fav_authorが空欄じゃないことを確認
            $member.favorite_authors[@num].update(author:@arr[@num])#空じゃなければ挿入
          else#空だった場合...存在したカラムを空欄にした
            $member.favorite_authors[@num].delete()
          end
        else#favorite_authorがnil
          if @arr[@num] != '' then#:fav_authorが空欄じゃないことを確認
            $member.favorite_authors.create(members_id:$id, author:@arr[@num], sort:@num + 1)#空じゃなければ作成
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

  def get_ref#リファラの取得
    @ref = request.referer
    @refs = @ref.split("/")
    @refs = @refs[@refs.length - 1]
  end

  def get_genre#genreのidとnameを結びつける
    if session[:prof][:fav_genre_0] != '0' then#idが0かそれ以外か
      #0以外ならidに対応するジャンル名をSQLで検索
      @fgenre1 =Bookgenre.find_by_sql(['select name from bookgenres where id=:id',{:id => session[:prof][:fav_genre_0]}])
    end
    if session[:prof][:fav_genre_1] != '0' then
      @fgenre2 =Bookgenre.find_by_sql(['select name from bookgenres where id=:id',{:id => session[:prof][:fav_genre_1]}])
    end
    if session[:prof][:fav_genre_2] != '0' then
      @fgenre3 =Bookgenre.find_by_sql(['select name from bookgenres where id=:id',{:id => session[:prof][:fav_genre_2]}])
    end
  end

  def get_member(numid)#変数の初期化
    $member = Member.find(numid)
    @genres = Bookgenre.all
    @genre_name = Bookgenre.find_by_sql(['select members_genres.members_id,members_genres.bookgenres_id,bookgenres.name from bookgenres join members_genres on members_genres.bookgenres_id=bookgenres.id where members_genres.members_id=:numid', {:numid=> numid}])
  end
end
