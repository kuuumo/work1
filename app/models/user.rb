class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  VALID_PHONETIC_REGEX = /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/
  validates :phonetic, presence: true,
                       format: {
                                with: VALID_PHONETIC_REGEX,
                                message: "全角カタカナのみで入力して下さい"
                       }

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :tel, presence: true, format: { with: VALID_PHONE_REGEX }

  validates :company, presence: true

  validates :department, presence: true

  validates :position, presence: true

  validates :employee_num, presence: true

  VALID_POST_CODE_REGEX = /\A\d{3}\-?\d{4}\z/
  validates :company_post_code, presence: true,
            format: { with: VALID_POST_CODE_REGEX }

  validates :company_location, presence: true

  validates :establishment_year, presence: true,
            numericality: { only_integer: true}

  validates :industry_type, presence: true

  validates :ceo_name, presence: true


end

