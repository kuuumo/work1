class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end


  private
    def user_params
      params.require(:user).permit(:name, :phonetic, :email, :tel, :company,
                                   :department, :position, :employee_num,
                                   :company_post_code, :company_location,
                                   :establishment_year, :industry_type, :ceo_name)
    end

end
