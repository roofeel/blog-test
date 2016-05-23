class Article < ActiveRecord::Base
  validates :title, :body, :presence => true
  has_many :comments, :as => :commentable
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  scope :recent, -> { order(created_at: :desc) }
end
