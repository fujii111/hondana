class MembersGenre < ActiveRecord::Base
  belongs_to :members
  belongs_to :boogenres
end
