class Book < ActiveRecord::Base
  belongs_to :members
  belongs_to :bookinfo, foreign_key: "bookinfos_id"
  validates :members_id, presence: true
  validates :bookinfos_id, presence: true
  validates :height, :numericality => true,:allow_blank => true
  validates :width,:numericality => true,:allow_blank => true
  validates :thick,:numericality => true,:allow_blank => true
  validates :weight,:numericality => true,:allow_blank => true
  validates :state, presence: true
  validates :sunburn, presence: true
  validates :scar, presence: true
  validates :graffiti, presence: true
  validates :broken, presence: true
  validates :obi, presence: true
  validates :smoke, presence: true
  validates :pet, presence: true
  validates :mold, presence: true
  validates :remarks, presence: true
  validates :books_flag, presence: true
end
