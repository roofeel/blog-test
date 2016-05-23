class Article < ActiveRecord::Base
  validates :title, :body, :presence => true
  has_many :comments, :as => :commentable

  scope :recent, -> { order(created_at: :desc) }
end
