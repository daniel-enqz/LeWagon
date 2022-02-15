class User < ActiveRecord::Base
  has_many :posts

  validates :username, :email, presence: true
  before_validation :strip_email
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  validates :username, uniqueness: true
  # TODO: Add some callbacks
  after_save :send_email

  private

  def strip_email
    self.email = email.strip unless email.nil?
  end

  def send_email
    FakeMailer.instance.mail("boris@lewagon.org", "Welcome to HN!")
  end
end
