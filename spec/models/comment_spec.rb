require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "should valid user exist" do
    expect(build(:comment, user: nil).valid?).not_to be_truthy
  end

  it "should valid body exist" do
    expect(build(:comment, body: nil).valid?).not_to be_truthy
  end

  it "should pass validated creating" do
    expect(build(:comment).valid?).to be_truthy
  end

  it "should auto set post lastest comment" do
    comment = create(:comment)
    expect(comment.commentable.lastest_comment1_id).to eq(comment.id)
  end

  it "should be ok to create article comment" do
    article_comment = create(:article_comment)
    expect(article_comment.commentable_type).to eq("Article")
  end
end
