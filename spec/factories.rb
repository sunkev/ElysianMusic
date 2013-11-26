FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "foo#{n}@example.com" }
    password '12345678'
    role 'user'
  end

  factory :admin, parent: :user do
    role 'admin'
  end

  factory :product do
    brand 'Gemeinhardt'
    model '3OSHB'
    description 'Really good'
    price '15'
    product_photo { Rack::Test::UploadedFile.new(File.join(Rails.root + 'spec/support/images/Flute pic.jpg')) }
  end
end
