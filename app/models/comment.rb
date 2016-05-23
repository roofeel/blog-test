class Comment < ActiveRecord::Base
  validates :user, :body, :presence => true
end
