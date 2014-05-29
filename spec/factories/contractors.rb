# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contractor do
    email { Faker::Internet.email}
    password '12345678'
    #password_confirmation '12345678'
    name { Faker::Name.name }
    #phone_number { Faker::PhoneNumber.phone_number.replace(/\D/g, '') }
    #city { Faker::Address.city }
    #country { Faker::Address.country }
  end
end
