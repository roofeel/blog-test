class Post < ActiveRecord::Base
  validates :title, :body, :presence => true
  has_many :comments, :as => :commentable
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  belongs_to :lastest_comment1, class_name: "Comment", foreign_key: "lastest_comment1_id"
  belongs_to :lastest_comment2, class_name: "Comment", foreign_key: "lastest_comment2_id"
  belongs_to :lastest_comment3, class_name: "Comment", foreign_key: "lastest_comment3_id"

  scope :recent, -> { order(created_at: :desc) }

  scope :load_comments, -> { includes(:lastest_comment1, :lastest_comment2, :lastest_comment3) }

  def lastest_comments
    result = []
    result << lastest_comment1 if lastest_comment1.present?
    result << lastest_comment2 if lastest_comment2.present?
    result << lastest_comment3 if lastest_comment3.present?
    result
  end
end
