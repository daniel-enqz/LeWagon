require 'pry-byebug'
class PostsView
  # TODO: implement methods called by the PostsController
  def ask_for(string)
    puts "What's the #{string}"
    print ">"
    gets.chomp
  end

  def ask_index
    puts "What's the index?"
    print ">"
    gets.chomp.to_i
  end

  def display(all)
    all.each { |post| puts "-#{post.id}, TITLE:#{post.title}, URL:#{post.url}, VOTES:#{post.votes}" }
  end
end
