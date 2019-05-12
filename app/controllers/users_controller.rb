class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render action: :show2
  end

  def new
    delete_temp
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      save_tmp("user", user_params)
      redirect_to new_company_path
    else
      render 'new'
    end
  end

  def confirm
    @user = session[:user_info]["user"]
    @company = session[:user_info]["company"]
  end

  def finish_confirm
    @user = User.new(session[:user_info]["user"])
    @user.save
    @company = Company.new(session[:user_info]["company"])
    @company.user_id = @user.id
    @company.save
    delete_temp
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:name, :phonetic, :email, :tel,:password,
                                   :password_confirmation)
    end

end
