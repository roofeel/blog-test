class Post < ActiveRecord::Base
  validates :title, :body, :presence => true
  has_many :comments

  scope :recent, -> { order(created_at: :desc) }
end
