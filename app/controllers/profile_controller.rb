class ProfileController < ApplicationController
  #require 'digest/sha1'
  #require 'bcrypt'

  $id = nil
  $member = nil
  def index
    if session[:id].nil? then
      redirect_to "/signin/"
    else
      $id = session[:id]
      $member = Member.includes(:Favorite_authors).where(:members_id => $id).references(:Favorite_authors)
      get_member($id)
    end

  end

  def edit
    $id = session[:id]

    get_member($id)
    get_ref
    if @refs == "profile" then#profile/indexから来てる時だけ処理
      session[:prof] = params[:prof]
      session[:prof][:pass] = $member.password_digest
      genre_find
    elsif @refs == "confirm" then
      #確認画面で戻るボタンを押した場合
      genre_find
    elsif @refs == "edit" then
      #編集画面に空欄があった場合
      genre_find
    else
      #上記に当てはまらない場合
      redirect_to :action => "index"
    end
  end

  def confirm
    $id = session[:id]
    get_ref
    if @refs == "edit" then
      #editから来てる時だけ処理
      session[:prof] = params[:prof]
      if params[:prof][:name] == "" && params[:prof][:name_kana] == "" && params[:prof][:nickname] == "" && params[:prof][:mail] == "" && params[:prof][:pass] == "" && params[:prof][:birth_year] == "" && params[:prof][:birth_month] == "" && params[:prof][:birth_day] == "" then
        #入力内容に空欄がある
        redirect_to({action: :edit} , notice: 'empty')
      end
    else
      redirect_to :action => "index"
    end
    @ifel = "3"
    get_genre
  end

  def comp
    if @refs == "confirm" then#confirmから来てる時だけ更新処理

      $id = session[:id]
      get_member($id)
      get_ref
      @birth = session[:prof][:birth_year] + session[:prof][:birth_month] + session[:prof][:birth_day]

      #profileの更新(パスワードは未着手)
      $member.update(name: session[:prof][:name],kana: session[:prof][:name_kana],nickname: session[:prof][:nickname],mail_address: session[:prof][:mail], address: session[:prof][:address], birthday:@birth)

      #favorite_authorの更新作業
      @arr = [session[:prof][:fav_author_0], session[:prof][:fav_author_1], session[:prof][:fav_author_2]]

      for num in 0..2 do
        if !!$member.favorite_authors.find_by(members_id:$id, sort:num + 1) then#favorite_authorがnilじゃないことを確認
          if @arr[num] != '' then#sessionの:fav_authorが空欄じゃないことを確認
            $member.favorite_authors[num].update(author:@arr[num])#空じゃなければ挿入
          else#空だった場合...存在したカラムを空欄にした
            $member.favorite_authors[num].delete()
          end
        else#favorite_authorがnil
          if @arr[num] != '' then#:fav_authorが空欄じゃないことを確認
            $member.favorite_authors.create(members_id:$id, author:@arr[num], sort:num + 1)#空じゃなければ作成
          end
        end
      end

      #members_genreの更新作業
      @arr = [session[:prof][:fav_genre_0], session[:prof][:fav_genre_1], session[:prof][:fav_genre_2]]
      #@mem.update(bookgenres_id:@arr[0])
      @mem =[3]
      for num in 0..2 do
        @mem[num] = MembersGenre.find_by(members_id:$id, sort:num + 1)

        if !!@mem[num] then#favorite_authorがnilじゃないことを確認
          if @arr[num] != '0' then#sessionの:fav_authorが「なし」じゃないことを確認
            @mem[num].update(bookgenres_id:@arr[num])#空じゃなければ挿入
          else#空だった場合...存在したカラムを空欄にした
            @mem[num].delete()
          end
        else#members_genresがnilの場合
          if @arr[num] != '0' then#:fav_genresが「なし」じゃないことを確認
            MembersGenre.create(members_id:$id, bookgenres_id:@arr[num], sort:num + 1)#空じゃなければ作成
          end
        end
      end
      session[:prof] = nil
    end
    #更新が終了したらプロフィールの表示画面に戻る
    redirect_to :action => "index"
  end

  def get_ref#リファラの取得
    @ref = request.referer
    if @ref != nil then
      @refs = @ref.split("/")
      @refs = @refs[@refs.length - 1]
    end
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

  def genre_find
    @g = [session[:prof][:fav_genre_0], session[:prof][:fav_genre_1],session[:prof][:fav_genre_2]]
    @g2 = [Bookgenre.find_by_sql(['select name from bookgenres where id=:id', {:id => @g[0]}]),Bookgenre.find_by_sql(['select name from bookgenres where id=:id', {:id => @g[1]}]), Bookgenre.find_by_sql(['select name from bookgenres where id=:id', {:id => @g[2]}])]
  end

  def get_member(numid)#変数の初期化
    $member = Member.find(numid)
    @genres = Bookgenre.all
    @genre_name = Bookgenre.find_by_sql(['select members_genres.members_id,members_genres.bookgenres_id,bookgenres.name from bookgenres join members_genres on members_genres.bookgenres_id=bookgenres.id where members_genres.members_id=:numid', {:numid=> numid}])
  end

end
