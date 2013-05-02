require 'faker'

number_of_users = 50
number_of_posts = number_of_users * 10
number_of_comments = number_of_posts * 30


number_of_users.times do
  User.create(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'password')
end


users = User.all

number_of_posts.times do 
  users.sample.posts << Post.create( 
    title: Faker::Lorem.sentence,
    link: Faker::Internet.url,
    body: Faker::Lorem.paragraphs)
end
posts = Post.all

number_of_comments.times do 
  the_comment = Comment.new(body: Faker::Lorem.paragraph)
  the_comment.user = users.sample
  the_comment.post = posts.sample
  the_comment.save
end
