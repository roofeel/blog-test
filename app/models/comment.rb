class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true

  validates :user, :body, :presence => true
  validates :body, length: { maximum: 150 }

  scope :recent, -> { order(created_at: :desc) }

  after_create :update_lastest_comment
  def update_lastest_comment
    if commentable_type == "Post"
      commentable.lastest_comment3_id = commentable.lastest_comment2_id
      commentable.lastest_comment2_id = commentable.lastest_comment1_id
      commentable.lastest_comment1_id = id
      commentable.save
    end
  end
end
