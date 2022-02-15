class Genre < ActiveRecord::Base
  has_many :tracks
  has_many :albums, -> { distinct }, through: :tracks
  has_many :artists, -> { distinct }, through: :albums
end

# has_and_belongs_to_many :orders, join_table: 'books_orders'
# has_many :authors, through: :books
