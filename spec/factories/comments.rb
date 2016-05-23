FactoryGirl.define do
  factory :comment do
    user "MyString"
    body "MyText"
    association :commentable, factory: :post
  end

  factory :article_comment, parent: :comment do
    association :commentable, factory: :article
  end
end
