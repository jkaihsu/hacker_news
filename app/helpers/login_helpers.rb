helpers do 

  def authenticate_login
    if @user && @user.authenticate(params[:email], params[:password])
      session[:id] = @user.id
      redirect to "/"
    else
      @error = 'Invalid email and/or password'
      erb :index
    end
  end

  def clear_session
    session.clear
  end

  def logged_in?
    return true if session[:id]
  end
  
end