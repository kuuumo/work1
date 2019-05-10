require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", phonetic: "イグザンプル　ユーザー",
                     tel: "09022345567", company: "Stark Industry",
                     department: "marketing", position: "ceo", employee_num: "6000",
                     company_post_code: "3501145", company_location: "埼玉県川越市",
                     establishment_year: "1999", industry_type: "IT", ceo_name: "Tony Stark",
                     password: "avengers", password_confirmation: "avengers")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "name should be present" do
    @user.name = " " * 6
    assert_not @user.valid?
  end

  test "email should be not too long" do
    @user.email = "a" * 256
    assert_not @user.valid?
  end

  test "email should be presence" do
    @user.email = " " * 9
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email should be saved as lower-case" do
    mixed_case_email = "User@eXampLe.Com"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "phonetic should be 全角カタカナ" do
    @user.phonetic = "hayato sugita"
    assert_not @user.valid?
  end

  test "phonetic should be present" do
    @user.phonetic = " "
    assert_not @user.valid?
  end

  test "telephone number should be integer" do
    @user.tel = "0943432.2"
    assert_not @user.valid?
  end

  test "telephone number should be present" do
    @user.tel = " "
    assert_not @user.valid?
  end

  test "company should be present" do
    @user.company = " "
    assert_not @user.valid?
  end

  test "department should be present" do
    @user.department = " "
    assert_not @user.valid?
  end

  test "position should be present" do
    @user.position = " "
    assert_not @user.valid?
  end

  test "employee_num should be present" do
    @user.employee_num = " "
    assert_not @user.valid?
  end

  test "company post code should be present" do
    @user.employee_num = " "
    assert_not @user.valid?
  end

  test "company location post code should be present" do
    @user.company_location = " "
    assert_not @user.valid?
  end

  test "establishment year should be present" do
    @user.establishment_year = " "
    assert_not @user.valid?
  end

  test "establishment year should be integer" do
    @user.establishment_year = "235234.3"
    assert_not @user.valid?
  end

  test "industry type should be present" do
    @user.industry_type = " "
    assert_not @user.valid?
  end

  test "ceo name should be present" do
    @user.ceo_name = " "
    assert_not @user.valid?
  end

  test " password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end


end
