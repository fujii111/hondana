class ProfileController < ApplicationController
  require 'digest/sha1'

  def index
    @id = params[:id]
    @member = Member.find(params[:id])
    @favolite_authors = Favolite_authors.find(params[@id])
    @members_genres = Members_genres.find(params[@id])
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
