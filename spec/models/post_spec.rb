require 'rails_helper'

describe Post, type: :model do
  it "should valid title exist" do
    expect(build(:post, title: nil).valid?).not_to be_truthy
  end

  it "should valid body exist" do
    expect(build(:post, body: nil).valid?).not_to be_truthy
  end

  it "should pass validated creating" do
    expect(build(:post).valid?).to be_truthy
  end
end

