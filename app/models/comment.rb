class Comment < ActiveRecord::Base
  validates :user, :body, :presence => true
  belongs_to :post

  validates :body, length: { maximum: 150 }

  scope :recent, -> { order(created_at: :desc) }
end
