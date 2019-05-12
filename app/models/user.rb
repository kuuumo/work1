class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_one :company

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  VALID_PHONETIC_REGEX = /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/
  validates :phonetic, presence: true,
                       format: { with: VALID_PHONETIC_REGEX,
                                 message: "全角カタカナのみで入力して下さい" }

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end

