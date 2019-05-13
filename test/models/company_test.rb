require 'test_helper'
require 'pry'
class CompanyTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", phonetic: "イグザンプル　ユーザー",
                     tel: "09022345567", password: "avengers", password_confirmation: "avengers")
    @user.save
    @company = Company.new(company: "Stark Industry",
                     department: "marketing", position: "ceo", employee_num: "6000",
                     company_post_code: "3501145", company_location: "埼玉県川越市",
                     establishment_year: "1999", industry_type: "IT", ceo_name: "Tony Stark",
                         user_id: @user.id)
  end

  test "company should be valid" do
    assert @company.valid?
  end

  test "company should be present" do
    @company.company = " "
    assert_not @company.valid?
  end

  test "department should be present" do
    @company.department = " "
    assert_not @company.valid?
  end

  test "position should be present" do
    @company.position = " "
    assert_not @company.valid?
  end

  test "employee_num should be present" do
    @company.employee_num = " "
    assert_not @company.valid?
  end

  test "company post code should be present" do
    @company.employee_num = " "
    assert_not @company.valid?
  end

  test "company location post code should be present" do
    @company.company_location = " "
    assert_not @company.valid?
  end

  test "establishment year should be present" do
    @company.establishment_year = " "
    assert_not @company.valid?
  end

  test "industry type should be present" do
    @company.industry_type = " "
    assert_not @company.valid?
  end

  test "ceo name should be present" do
    @company.ceo_name = " "
    assert_not @company.valid?
  end

  test "valid_without_user should do right" do
    @company.user_id = " "
    @company.valid?
    binding.pry
    assert @company.errors.count <= 1 && @company.errors[:user].present?
  end

end