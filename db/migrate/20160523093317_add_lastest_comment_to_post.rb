class AddLastestCommentToPost < ActiveRecord::Migration
  def change
    add_column :posts, :lastest_comment1_id, :integer
    add_column :posts, :lastest_comment2_id, :integer
    add_column :posts, :lastest_comment3_id, :integer
  end
end
