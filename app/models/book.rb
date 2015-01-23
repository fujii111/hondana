class Book < ActiveRecord::Base
  belongs_to :members
  belongs_to :bookinfos

  VALID_NUMBER_REGEX = /\A[0-9]+\z/i

  validates :members_id, presence: true
  validates :bookinfos_id, presence: true
  validates :height, presence: true
  validates :width, presence: true
  validates :thick, presence: true
  validates :weight, presence: true
  validates :state, presence: true
  validates :sunburn, presence: true
  validates :scar, presence: true
  validates :graffiti, presence: true
  validates :broken, presence: true
  validates :obi, presence: true
  validates :smoke, presence: true
  validates :pet, presence: true
  validates :mold, presence: true
  validates :books_flag, presence: true
end
