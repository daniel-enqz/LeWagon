# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.
require 'pry-byebug'

class Post
  attr_reader :votes, :id
  attr_accessor :title, :url

  def initialize(attributes = {})
    @title = attributes[:title]
    @url = attributes[:url]
    @votes = attributes[:votes]
    @id = attributes[:id]
  end

  def self.find(id)
    result = DB.execute("SELECT * FROM posts WHERE id = ?", id).flatten
    post = Post.new(id: id, title: result[1], url: result[2], votes: result[3])
    post.title.nil? ? nil : post
  end

  def self.all
    all = DB.execute("SELECT * FROM posts")
    posts = []
    all.each do |post|
      posts << Post.new(id: post[0], title: post[1], url: post[2], votes: post[3])
    end
    posts
  end
end
