FactoryBot.define do
  factory :member do
    user { nil }
    team { nil }
    position { "MyString" }
    number { "MyString" }
  end
end
