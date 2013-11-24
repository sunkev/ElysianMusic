FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com" }
    password '12345678'
    role 'user'
  end

  factory :admin, parent: :user do
    role 'admin'
  end
end
