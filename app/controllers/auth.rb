get '/login' do
  erb :login
end

get '/logout' do 
  clear_session
  redirect '/'
end

get '/signup' do
  erb :signup
end

post '/user/signup' do
  @user = User.new(params)
  if @user.save
    session[:id] = @user.id
    redirect to '/'
  else 
    @errors = @user.errors
    erb :signup
  end 
end

post '/user/login' do
  @user = User.find_by_email(params[:email])
  authenticate_login
end