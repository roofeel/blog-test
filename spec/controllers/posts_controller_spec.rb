require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "#index" do
    it "should have an index action" do
      get :index
      expect(response).to be_success
    end
  end

  describe "#show" do
    it "should have an show action" do
      new_post = create(:post)
      get :show, id: new_post.id
      expect(response).to be_success
    end
  end

  describe "#new" do
    it "should have an new action" do
      get :new
      expect(response).to be_success
    end
  end

  describe "#edit" do
    it "should have an edit action" do
      new_post = create(:post)
      get :edit, id: new_post.id
      expect(response).to be_success
    end
  end

  describe "#create" do
    it "should be ok if params validate" do
      post :create, post: {title: "title", body: "body" }
      expect(response).to redirect_to(posts_path)
    end

    it "should be fail if params invalidate" do
      post :create, post: { title: "title"}
      expect(response).not_to redirect_to(posts_path)
    end
  end

  describe "#update" do
    let(:new_post) { create :post }

    it "should be ok if params validate" do
      put :update, post: {title: "title updated"}, id: new_post.id
      expect(response).to redirect_to(posts_path)
    end

    it "should be fail if params invalidate" do
      put :update, post: {title: ""}, id: new_post.id
      expect(response).not_to redirect_to(posts_path)
    end
  end

  describe "#destroy" do
    it "should be ok if validate" do
      new_post = create(:post)
      expect {
        delete :destroy, id: new_post.id
      }.to change(Post, :count).by(-1)
    end
  end
end
