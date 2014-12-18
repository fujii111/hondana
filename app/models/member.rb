class Member < ActiveRecord::Base
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
