class Bookinfo < ActiveRecord::Base
  has_many :books
  has_many :members_books
  has_many :bookinfo_genres

  VALID_NUMBER_REGEX = /\A[0-9]+\z/i
  VALID_FILE_FORMAT = /.(gif|jpg|png|jpeg)\z/

  validates :name, presence: true
  validates :publisher, presence: true
  validates :author, presence: true
  #validates :langage, presence: true
  validates :release_date, presence: true
  #validates :height, presence: true
  #validates :width, presence: true
  #validates :thinck, presence: true
  #validates :isbn10, format: { with: VALID_NUMBER_REGEX },length: { minimum: 10 },length: { maximum: 10 }
  validates :isbn13, format: { with: VALID_NUMBER_REGEX },length: { minimum: 13 },length: { maximum: 13 }
  #validates :content
  validates :picture, format: { with: VALID_FILE_FORMAT, message: 'はGIF、JPG、PNG画像のURLでなければなりません。'}
end