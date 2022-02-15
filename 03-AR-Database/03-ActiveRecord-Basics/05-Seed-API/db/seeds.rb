require "json"
require "rest-client"

10.times do |i|
  response = RestClient.get "https://hacker-news.firebaseio.com/v0/item/#{i + 1}.json"
  repos = JSON.parse(response)
  # => repos is an `Array` of `Hashes`.
  post = Post.create(title: repos["title"], url: repos["url"], votes: repos["score"], id: repos["id"])
  puts "[#{post.votes}] #{post.title} - #{post.url} - #{post.id}"
end
