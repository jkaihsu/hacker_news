get '/user/:id/posts' do
  @user = User.find(params[:id])
  erb :user_posts
end

get '/user/:id/comments' do
  @user = User.find(params[:id])
  erb :user_comments
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :user
end