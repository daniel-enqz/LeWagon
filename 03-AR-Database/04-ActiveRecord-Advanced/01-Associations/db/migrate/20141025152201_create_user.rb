class CreateUser < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string      :username
      t.string      :email
      t.timestamps null: false
    end
  end
end
