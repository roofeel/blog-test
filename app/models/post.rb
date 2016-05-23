class Post < ActiveRecord::Base
  validates :title, :body, :presence => true

  scope :recent, -> { order(created_at: :desc) }
end
