FactoryGirl.define do
  factory :comment do
    comment "this is a test comment"
    user nil
    post nil
  end
end
