require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "should valid name exist" do
    expect(build(:tag, name: nil).valid?).not_to be_truthy
  end

  it "should add tag to post" do
    post = create(:post)
    Tag.add("tag", post)
    expect(post.tags.count).to eq(1)
  end

  it "should add multiple tags to post" do
    post = create(:post)
    Tag.add("tag", post)
    Tag.add("tag2", post)
    expect(post.tags.count).to eq(2)
  end

  it "should add tag to article" do
    article = create(:article)
    Tag.add("tag", article)
    expect(article.tags.count).to eq(1)
  end

  it "should avoid to add exist tag" do
    post = create(:post)
    article = create(:article)
    Tag.add("tag", post)
    Tag.add("tag", post)
    Tag.add("tag", article)
    expect(post.tags.count).to eq(1)
  end
end
