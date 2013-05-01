get '/' do 
  @all_posts = Post.all
  erb :index  
end

get '/post/create' do
  erb :post_create
end

post '/post/create' do
  Post.create(params)
end

get '/post/:id' do
  @the_post = Post.find(params[:id])
  erb :post
end

post '/user/create' do
  @the_user = User.create(params)
  session[:user_id] = @the_user.id
  redirect '/'
end

get '/user/:id/posts' do
  @the_user = User.find(params[:id])
  erb :user_posts
end

get '/user/:id/comments' do
  @the_user = User.find(params[:id])
  erb :user_comments
end

get '/user/:id' do
  @the_user = User.find(params[:id])
  erb :user
end

get '/login' do
  erb :login
end

post '/login' do 
  if User.login(params)
    @the_user = User.find_by_email(params[:email])
    session[:user_id] = @the_user.id
    redirect '/'
  else
    "Login error"
  end
end

post '/logout' do 
  session.clear
  erb :index
end