require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "should valid name exist" do
    expect(build(:tag, name: nil).valid?).not_to be_truthy
  end

  context "self.add_by_params" do
    it "should avoid to add if name is nil" do
      expect(Tag.add_by_params(nil, "Post", 1)).to eq(nil)
    end

    it "should avoid to add if type not valid" do
      expect(Tag.add_by_params(nil, 1, 1)).to eq(nil)
    end

    it "should avoid to add if type not exist" do
      expect(Tag.add_by_params(nil, "Node", 1)).to eq(nil)
    end

    it "should add tag to post" do
      post = create(:post)
      Tag.add_by_params("tag", "Post", post.id)
      expect(post.tags.count).to eq(1)
    end

    it "should add multiple tags to post" do
      post = create(:post)
      Tag.add_by_params("tag", "Post", post.id)
      Tag.add_by_params("tag2", "Post", post.id)
      expect(post.tags.count).to eq(2)
    end

    it "should add tag to article" do
      article = create(:article)
      Tag.add_by_params("tag", "Article", article.id)
      expect(article.tags.count).to eq(1)
    end

    it "should avoid to add exist tag" do
      post = create(:post)
      article = create(:article)
      Tag.add_by_params("tag", "Post", post.id)
      Tag.add_by_params("tag", "Post", post.id)
      Tag.add_by_params("tag", "Article", article.id)
      expect(post.tags.count).to eq(1)
    end
  end
end
