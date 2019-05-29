FactoryBot.define do
  factory :member do
    user { nil }
    team { nil }
    position { "MemberPosition" }
    number { "MemberNumber" }
  end
end
