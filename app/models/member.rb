class Member < ActiveRecord::Base
  #favorite_authorsへアクセスのためのおまじない
  has_many :favorite_authors, foreign_key: 'members_id'
  accepts_nested_attributes_for :favorite_authors

  validates :login_id, presence: true
  validates :name, presence: true
  validates :kana, presence: true
  validates :birthday, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail_address, presence: true,presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true
  #has_secure_password
end
