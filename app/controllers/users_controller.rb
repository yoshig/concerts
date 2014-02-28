class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      login!
      redirect_to @user.is_a_band? ? new_band_url : concerts_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render "new"
    end
  end

  def new
    @user = User.new
    render "new"
  end

  private
  def user_params
    params.require(:user).permit!
  end

end
