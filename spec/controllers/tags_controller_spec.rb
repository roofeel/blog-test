require 'rails_helper'

RSpec.describe TagsController, type: :controller do
  describe "#create" do
    it "should be ok if params valid" do
      new_post = create(:post)
      expect {
        post :create, name: "tag_name", taggable_type: "Post", taggable_id: new_post.id, format: :js
      }.to change(Tag, :count).by(1)
      expect(response).to be_success
    end
  end
end
