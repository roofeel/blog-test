require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:new_post) { create(:post) }

  describe "#index" do
    it "should have an index action" do
      get :index, commentable_id: new_post.id, commentable_type: new_post.class.name
      expect(response).to be_success
    end
  end

  describe "#create" do
    it "should be ok if create by js" do
      expect {
        post :create, comment: { user: "user1", body: "body", commentable_id: new_post.id, commentable_type: "Post" }, format: :js
      }.to change(Comment, :count).by(1)
      expect(response).not_to redirect_to(post_path(new_post.id))
    end
  end

  describe "#destroy" do
    it "should be ok if valid" do
      comment = create(:comment)
      expect {
        delete :destroy, id: comment.id, format: :js
      }.to change(Comment, :count).by(-1)
    end
  end

end
