post '/comment/create/:id' do
  @post = Post.find(params[:id])
  comment = Comment.create(:user_id => session[:id],
                           :post_id => @post.id,
                           :body => params[:body])

   
  redirect "/post/#{@post.id}"
end

