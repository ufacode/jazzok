class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show # authorize! :read, @user
  end

  def edit # authorize! :update, @user
  end

  def update # authorize! :update, @user
    if @user.update(user_params)
      sign_in(@user == current_user ? @user : current_user, bypass: true)
      redirect_to @user, notice: 'Your profile was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def finish_signup # authorize! :update, @user
    if request.patch? && params[:user] # && params[:user][:email]
      if @user.update(user_params)
        @user.skip_reconfirmation!
        sign_in(@user, bypass: true)
        redirect_to @user, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  def destroy # authorize! :delete, @user
    @user.destroy
    redirect_to root_url
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    accessible = [:name, :email] # extend with your own params
    accessible << [:password, :password_confirmation] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end
