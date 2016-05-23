class CommentsController < ApplicationController

  def index
    load_commentable(params)
    @comments = @commentable.comments.recent.paginate(page: params[:page], per_page: 20)
  end

  def create
    load_commentable(comment_params)
    @comment = @commentable.comments.new(comment_params)
    @success = @comment.save
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def load_commentable(params)
    @commentable = params[:commentable_type].classify.safe_constantize.find(params[:commentable_id])
  end

  def comment_params
    params.require(:comment).permit(:user, :body, :commentable_id, :commentable_type)
  end
end
