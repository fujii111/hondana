class Member < ActiveRecord::Base
  before_save { self.mail_address = mail_address.downcase }
  before_create :create_remember_token
  validates :login_id, presence: true
  validates :name, presence: true
  validates :kana, presence: true
  validates :birthday, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :mail_address, presence: true,presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :address, presence: true
  has_secure_password

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
