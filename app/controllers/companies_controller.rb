class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.valid_without_user?
      save_tmp("company", company_params)
      redirect_to confirm_users_path
    else
      render 'new'
    end
  end

  private
    def company_params
      params.require(:company).permit(:company, :department, :position, :employee_num,
                                      :company_post_code, :company_location,
                                      :establishment_year, :industry_type, :ceo_name, :user_id)
    end

end