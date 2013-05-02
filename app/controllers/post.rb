get '/post/create' do
  erb :post_create
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end

post '/post/create' do
  @post = Post.new(params)
  @post.user_id = session[:id] 
  @post.save
  redirect "/post/#{@post.id}"
end

post '/post/vote/:id' do
  @post = Post.find(params[:id])
  @test = PostVote.create(:post_id => @post.id,
                  :user_id => session[:id])
  #PostVote.find_or_create_by_post_id_and_user_id(:postid, :userid)
  p "find me"
  p @test
  redirect "/post/#{@post.id}"
end