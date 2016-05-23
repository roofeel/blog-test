require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:new_post) { create(:post) }

  describe "#index" do
    it "should have an index action" do
      get :index, post_id: new_post.id
      expect(response).to be_success
    end
  end

  describe "#create" do
    it "should be ok if params valid" do
      expect {
        post :create, post_id: new_post.id, comment: { user: "user1", body: "body" }
      }.to change(Comment, :count).by(1)
      expect(response).to redirect_to(post_path(new_post.id))
    end

    it "should be ok if create by js" do
      expect {
        post :create, post_id: new_post.id, comment: { user: "user1", body: "body" }, format: :js
      }.to change(Comment, :count).by(1)
      expect(response).not_to redirect_to(post_path(new_post.id))
    end
  end

  describe "#destroy" do
    it "should be ok if valid" do
      comment = create(:comment)
      expect {
        delete :destroy, post_id: comment.post_id, id: comment.id
      }.to change(Comment, :count).by(-1)
    end
  end

end
