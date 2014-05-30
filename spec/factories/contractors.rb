# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contractor do
    email { Faker::Internet.email }
    password '12345678'
    name { Faker::Name.name }
    location { create(:location) }
    phone_number { Faker::PhoneNumber.phone_number.gsub(/\D/, '')[0..9] }
  end
end
