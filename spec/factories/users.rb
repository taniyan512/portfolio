FactoryBot.define do
  factory :user do
    sequence(:email)   { |n| "person#{n}@example.com" }
    password           { "123456" }
    user_name          { "test" }
    self_introduce     { "test" }
  end
end
