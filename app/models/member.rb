class Member < ActiveRecord::Base
  #favorite_authorsへアクセスのためのおまじない
  has_many :favorite_authors, foreign_key: 'members_id'
  has_many :book
  has_many :notices
  has_many :trades
  has_many :members_genres
  accepts_nested_attributes_for :favorite_authors

  #before_save { self.mail_address = mail_address.downcase }
  before_create :create_remember_token
  VALID_LOGIN_REGEX = /\A[a-z0-9]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_KANA_REGEX = /\p{Katakana}/
  validates :login_id, presence: true,:uniqueness =>{:scope => :quit}, format: { with: VALID_LOGIN_REGEX }, length: { maximum: 10 },length: { minimum: 4 }
  validates :name, presence: true
  validates :kana, presence: true, format: { with: VALID_KANA_REGEX }
  validates :birthday, presence: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 },confirmation: true, on: :create
  validates :nickname, presence: true, length: { maximum: 10 }
  validates :mail_address, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: true
  validates :address, presence: true



  def Member.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Member.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = Member.encrypt(Member.new_remember_token)
    end
end
