get '/' do 
  @all_posts = Post.all
  erb :index  
end

get '/post/create' do
  erb :post_create
end

get '/post/:id' do
  @the_post = Post.find(params[:id])
  erb :post
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
