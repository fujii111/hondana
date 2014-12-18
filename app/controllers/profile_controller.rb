class ProfileController < ApplicationController
  require 'digest/sha1'

  def index
    #@member = Member.find(params[:id])
    #@favolite_authors = Favolite_authors
    #@members_genres = Members_genres
  end

  def edit

  end

  def comp
    @prof = prof
    #postでもらってきたパスワードをハッシュ化して、Member.passwordと比較
    #一致すればパスワードは変更されていない
    #一致しなければ新規パスワードとしてハッシュ化、保存される
    if @member.password == Digest::SHA1.hexdigest(@prof.pass) then
    else
    end
  end
end
