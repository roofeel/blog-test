FactoryGirl.define do
  factory :comment do
    user "MyString"
    body "MyText"
    association :post
  end
end
