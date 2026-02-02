class UsersController < ApplicationController
  def account
    @user = current_user
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
       log_in @user 
       redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy 
    terminate_session 
    Current.user.destroy
    redirect_to root_path, "Your Account has been deleted."
  end

  private
    def  user_params
      params.require(:user).permit(:name, :email, :password, 
                                   :password_confirmation)
    end
end
