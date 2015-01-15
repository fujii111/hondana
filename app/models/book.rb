class Book < ActiveRecord::Base
  belongs_to :members
  belongs_to :bookinfos
end
