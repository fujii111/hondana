class Bookinfo < ActiveRecord::Base
  has_many :bookinfos
  has_many :members_books
  has_many :bookinfo_genres
end