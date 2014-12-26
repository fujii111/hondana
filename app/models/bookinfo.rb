
class Bookinfo < ActiveRecord::Base
  has_many :books
  has_many :members_books
  has_many :bookinfo_genres
end