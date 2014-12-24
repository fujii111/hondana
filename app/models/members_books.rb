class MembersBooks < ActiveRecord::Base
  belongs_to :members
  belongs_to :bookinfos
end
