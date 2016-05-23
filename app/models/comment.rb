class Comment < ActiveRecord::Base
  validates :user, :body, :presence => true
  belongs_to :post

  validates :body, length: { maximum: 150 }

  scope :recent, -> { order(created_at: :desc) }

  after_create :update_lastest_comment
  def update_lastest_comment
    post.lastest_comment3_id = post.lastest_comment2_id
    post.lastest_comment2_id = post.lastest_comment1_id
    post.lastest_comment1_id = id
    post.save
  end
end
