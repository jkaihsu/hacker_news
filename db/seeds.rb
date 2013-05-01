require 'faker'

number_of_users = 13
number_of_posts = number_of_users * 7
number_of_comments = number_of_posts * 13

number_of_users.times do
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              email: Faker::Internet.email,
              password: '1234')
end
users = User.all


