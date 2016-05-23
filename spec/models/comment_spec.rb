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
end