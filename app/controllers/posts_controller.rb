class PostsController < ApplicationController
  def index
    @posts = Post.recent.paginate(page: params[:page], per_page: 20)
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to(posts_path, notice: "创建成功")
    else
      render action: 'new'
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to(posts_path, notice: "更新成功")
    else
      render action: "edit"
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(posts_path, notice: "删除成功")
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

