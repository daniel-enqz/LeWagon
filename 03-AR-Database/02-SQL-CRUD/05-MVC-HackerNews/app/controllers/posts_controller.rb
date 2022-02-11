require_relative "../models/post"
require_relative "../views/posts_view"
require 'pry-byebug'

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    all = Post.all
    @view.display(all)
  end

  def create
    # TODO: implement creating a new post
    title = @view.ask_for("title")
    url = @view.ask_for("url")
    votes = @view.ask_for("votes").to_i
    post = Post.new(title: title, url: url, votes: votes)
    post.save
  end

  def update
    # TODO: implement updating an existing post
    index
    all = Post.all
    index_to_update = @view.ask_index
    title = @view.ask_for("title")
    url = @view.ask_for("url")
    votes = all[index_to_update - 1].votes
    post = Post.new(title: title, url: url, id: index_to_update, votes: votes)
    post.save
  end

  def destroy
    index
    index_to_update = @view.ask_index
    post = Post.find(index_to_update)
    post.destroy
  end

  def upvote
    # TODO: implement upvoting a post
    index
    all = Post.all
    index_to_update = @view.ask_index
    votes = all[index_to_update - 1].votes + 1
    title = all[index_to_update - 1].title
    url = all[index_to_update - 1].url
    post = Post.new(title: title, url: url, id: index_to_update, votes: votes)
    post.save
  end
end
