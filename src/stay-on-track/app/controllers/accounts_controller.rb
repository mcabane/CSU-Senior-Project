class AccountsController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(account_params)
      redirect_to account_path, notice: "User settings updated successfully."
    else
      render :edit, status: :unprocessable_content
    end

  end

  def destroy
    @user = current_user
    @user.destroy
    reset_session   # logs the user out
    redirect_to root_path, notice: "Your account has been deleted."
  end

  private
  def account_params
    permitted = [:name, :email]
    if params[:user][:password].present?
      permitted += [:password, :password_confirmation]
    end
    params.require(:user).permit(permitted)

  end
end
