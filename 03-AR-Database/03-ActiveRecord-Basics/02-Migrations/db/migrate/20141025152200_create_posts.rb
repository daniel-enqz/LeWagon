class CreatePosts < ActiveRecord::Migration[6.0]
  # TODO: your code here to create the posts table
  def change
    create_table :posts do |p|
      p.string :title
      p.string :url
      p.timestamps
    end
  end
end
