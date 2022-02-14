class AddColumnToPosts < ActiveRecord::Migration[6.0]
  # TODO: your code here to create the posts table
  def change
    add_column :posts, :votes, :integer, default: 0, null: false
  end
end
