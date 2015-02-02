class Bookinfo < ActiveRecord::Base
  has_many :books
  has_many :members_books
  has_many :bookinfo_genres

  VALID_NUMBER_REGEX = /\A([0-9]{10}|[0-9]{13}|不明|)\Z/
  VALID_FILE_FORMAT = /.(gif|jpg|png|jpeg)\Z/

  validates :name, presence: true
  validates :publisher, presence: true
  validates :author, presence: true
  #validates :langage, presence: true
  #validates :release_date, presence: true
  #validates :height, presence: true
  #validates :width, presence: true
  #validates :thinck, presence: true
  #validates :isbn10, format: { with: VALID_NUMBER_REGEX },length: { minimum: 10 },length: { maximum: 10 }
  validates :isbn13, format: { with: VALID_NUMBER_REGEX, message: 'は10桁または13桁でなければなりません。' }
  #validates :content, presence: true
  validates :picture, format: { with: VALID_FILE_FORMAT, message: 'はGIF、JPG、PNGのいずれかの画像でなければなりません。'}
end