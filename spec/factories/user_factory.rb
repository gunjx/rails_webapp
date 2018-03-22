FactoryBot.define do
  sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email
    password 'test1234'
    first_name 'Test'
    last_name 'User'
    admin false
  end

  factory :admin, class: User do
    email
    password 'qwertzuio'
    admin true
    first_name 'Admin'
    last_name 'User'
  end

end
