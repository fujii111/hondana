class Bookgenre < ActiveRecord::Base
  has_many :members_genres
  has_many :bookinfo_genres
end
