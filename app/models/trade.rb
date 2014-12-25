class Trade < ActiveRecord::Base
  belongs_to :members
  belongs_to :book
end
