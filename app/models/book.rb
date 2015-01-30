class Book < ActiveRecord::Base
  belongs_to :members
  belongs_to :bookinfo, foreign_key: "bookinfos_id"
  validates :members_id, presence: true
  validates :bookinfos_id, presence: true
  validates :height, presence: true,:numericality => { :only_integer => true }
  validates :width, presence: true,:numericality => { :only_integer => true }
  validates :thick, presence: true,:numericality => { :only_integer => true }
  validates :weight, presence: true,:numericality => { :only_integer => true }
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
