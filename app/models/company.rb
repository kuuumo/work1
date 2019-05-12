class Company < ApplicationRecord
  belongs_to :user, dependent: :destroy


  validates :company, presence: true

  validates :department, presence: true

  validates :position, presence: true

  validates :employee_num, presence: true

  VALID_POST_CODE_REGEX = /\A\d{3}\-?\d{4}\z/
  validates :company_post_code, presence: true,
            format: { with: VALID_POST_CODE_REGEX }

  validates :company_location, presence: true

  validates :establishment_year, presence: true

  validates :industry_type, presence: true

  validates :ceo_name, presence: true

  def valid_without_user?
    valid?
    errors.count <= 1 && errors[:user].present?
  end
end
