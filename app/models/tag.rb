class Tag < ActiveRecord::Base
  has_many :taggings, dependent: :destroy
  has_many :posts, through: :taggings, source: :taggable, source_type: Post
  has_many :articles, through: :taggings, source: :taggable, source_type: Article
  validates :name, :presence => true

  def self.add_by_params(tag_name, taggable_type, taggable_id)
    tag = Tag.find_or_create_by(name: tag_name)
    return if tag.id.blank? || taggable_type.classify.nil?
    taggable = taggable_type.classify.safe_constantize.find(taggable_id)
    return if taggable.blank?
    tagging = Tagging.find_or_create_by(tag_id: tag.id, taggable_id: taggable_id, taggable_type: taggable_type)
    tagging
  end
end