class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings, source: :taggable, source_type: Post
  has_many :articles, through: :taggings, source: :taggable, source_type: Article
  validates :name, :presence => true

  def self.add(tag_name, obj)
    tag = Tag.find_or_create_by(name: tag_name)
    Tagging.find_or_create_by(tag_id: tag.id, taggable_id: obj.id, taggable_type: obj.class.name)
  end
end