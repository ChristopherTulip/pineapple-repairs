# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contractor do
    email { Faker::Internet.email}
    password '12345678'
    password_confirmation '12345678'
    name { Faker::Name.name }
  end
end
