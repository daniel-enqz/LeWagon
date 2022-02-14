require "json"
require "rest-client"
require "pry-byebug"

10.times do |i|
  response = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{i + 1}.json"
  repos = JSON.parse(response)
  # => repos is an `Array` of `Hashes`.
  post = Post.create(title: repos["title"], url: repos["url"], votes: 2)
  post.save!
end
