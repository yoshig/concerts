module SessionsHelper
  def login!
    if current_session = find_session #should never happen
      session[:token] = current_session.reset_token!
    else
      new_session = Session.create(user_id: @user.id)
      session[:token] = new_session.token
    end
    redirect_to concerts_url
  end

  def find_session
    return nil if session[:token].nil?
    Session.find_by(token: session[:token])
  end

  def logged_in?
    !!current_user
  end

  def logout!
    current_session.destroy
    session[:token] = nil
  end

  def current_user
    if user = current_session
      @current_user = User.find(user.user_id)
    end
  end

  def current_session
    return nil if session[:token].nil?
    Session.find_by(token: session[:token])
  end
end
