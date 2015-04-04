FactoryGirl.define do
  factory :category do
    name { Faker::Commerce.department(1) }
    uri  { Faker::Internet.domain_word }
  end
end
