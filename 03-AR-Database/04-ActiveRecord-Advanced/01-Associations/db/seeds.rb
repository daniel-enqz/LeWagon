# TODO: Write a seed
require "faker"
require "pry-byebug"
5.times do
  user = User.create(username: Faker::Games::Heroes.name, email: Faker::Internet.email)
  7.times do
    post = Post.new(title: Faker::Quote.singular_siegler,
                    url: Faker::FunnyName.name,
                    votes: rand(0..1000))
    post.user = user
    post.save
  end
end
