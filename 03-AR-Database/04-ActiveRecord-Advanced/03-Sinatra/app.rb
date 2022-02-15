require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

require_relative "config/application"

set :views, (proc { File.join(root, "app/views") })
set :bind, '0.0.0.0'

get '/' do
  @posts = Post.all
  erb :posts # Do not remove this line
end

# TODO: add more routes to your app!
get "/:id" do
  @post = Post.find(params[:id])
  erb :show
end
