class ChangeCommentToPolymorphic < ActiveRecord::Migration
  def change
    rename_column :comments, :post_id, :commentable_id
    add_column :comments, :commentable_type, :string
    add_index :comments, :commentable_id
    add_index :comments, :commentable_type
  end
end
