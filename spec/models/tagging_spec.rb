require 'rails_helper'

RSpec.describe Tagging, type: :model do
  it "should be ok if valid" do
    expect(build(:tagging).valid?).to be_truthy
  end
end
