require 'rails_helper'

RSpec.describe Article, type: :model do
  it "should valid title exist" do
    expect(build(:article, title: nil).valid?).not_to be_truthy
  end

  it "should valid body exist" do
    expect(build(:article, body: nil).valid?).not_to be_truthy
  end

  it "should pass validated creating" do
    expect(build(:article).valid?).to be_truthy
  end
end
