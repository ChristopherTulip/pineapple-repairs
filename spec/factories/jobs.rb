# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
