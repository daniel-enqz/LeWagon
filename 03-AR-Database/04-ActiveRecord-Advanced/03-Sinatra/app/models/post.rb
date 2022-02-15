class Post < ActiveRecord::Base
  belongs_to :user

  validates :user, :title, :url, presence: true
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :title, length: { minimum: 5 }
  validates :title, uniqueness: { case_sensitive: false }
end
