class CommentsController < ApplicationController
  before_action :load_post

  def index
    @comments = @post.comments.recent.paginate(page: params[:page], per_page: 20)
  end

  def create
    @comment = @post.comments.new(comment_params)
    @success = @comment.save

    respond_to do |format|
      format.html do
        redirect_to(post_path(@post.id), notice: @success ? "评论创建成功" : "评论创建失败")
      end
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(posts_path, notice: "评论删除成功")
  end

  private

  def load_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:user, :body)
  end
end
