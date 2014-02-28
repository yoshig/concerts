class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.find_by_credentials(params[:user][:username],
                                        params[:user][:password])
      login!
      redirect_to concerts_url
    else
      @user = User.new
      flash.now[:errors] = ["Invalid credentials"]
      render "new"
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
