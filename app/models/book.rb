class Book < ActiveRecord::Base
  has_many :trade
  belongs_to :members
  belongs_to :bookinfos
end
