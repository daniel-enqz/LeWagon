require_relative "../views/posts_view"

class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    # DO NOT WRITE SQL QUERIES
    # TODO: gather all posts from the database
    # TODO: give them to the view to be printed
    posts = Post.all
    @view.display(posts)
  end

  def create
    # DO NOT WRITE SQL QUERIES
    # TODO: create a post
    title = @view.ask_for("title")
    url = @view.ask_for("url")
    votes = @view.ask_for("votes").to_i
    post = Post.new(
      title: title,
      url: url,
      votes: votes
    )
    post.save
  end

  def update
    # DO NOT WRITE SQL QUERIES
    # TODO: update a post
    index
    index_to_update = @view.ask_index
    title = @view.ask_for("title")
    url = @view.ask_for("url")
    votes = Post.find(index_to_update).votes
    post = Post.new(title: title, url: url, id: index_to_update, votes: votes)
    post.save
    @view.show_greeting
    index
  end

  def destroy
    index
    index_to_update = @view.ask_index
    post = Post.find(index_to_update)
    post.destroy
    post.save
    @view.show_greeting
    index
  end

  def upvote
    # DO NOT WRITE SQL QUERIES
    # TODO: increment the `votes` column for a post
    index
    index_to_update = @view.ask_index
    votes = Post.find(index_to_update).votes
    title = Post.find(index_to_update).title
    url = Post.find(index_to_update).url
    post = Post.new(title: title, url: url, id: index_to_update, votes: votes + 1)
    post.save
    @view.show_greeting
    index
  end
end
