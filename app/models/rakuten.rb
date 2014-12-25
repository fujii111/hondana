require 'active_resource'
class Rakuten < ActiveResource::Base
  self.site     = "http://app.rakuten.co.jp" #リソースのURL
  self.format   = :json #リソースのフォーマット
  AFFILIATE_ID  = "12169043.4164998a.12169044.3519539e"
  DEVELOPER_ID  = "1029724767561681573"
  VERSION       = "2013-05-22"
  FROM          = "/services/api/BooksBook/Search"

  def self.item_search(keyword, genre_id=0, page=1)
    self.find(
      :one,
      :from => FROM,
      :params => {
        :developerId  =>  DEVELOPER_ID,
        :affiliateId  =>  AFFILIATE_ID,
        :version      =>  VERSION,
        :operation    =>  "BookBookSearch",
        :genreId      =>  genre_id,
        :page         =>  page,
        :keyword      =>  keyword
      }
    )
  end
end
