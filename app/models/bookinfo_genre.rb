class BookinfoGenre < ActiveRecord::Base
  belongs_to :bookgenres
  belongs_to :bookinfo
end
