get '/' do 
  @all_posts = Post.limit(50)
  erb :index  
end

