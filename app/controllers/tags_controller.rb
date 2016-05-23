class TagsController < ApplicationController
  def create
    params = tag_param
    @tagging = Tag.add_by_params(params[:name], params[:taggable_type], params[:taggable_id])
  end

  private

  def tag_param
    params.permit(:name, :taggable_id, :taggable_type)
  end
end
