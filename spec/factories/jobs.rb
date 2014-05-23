# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :job do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number }

    device { create( :device ) }
    model { create( :model ) }
    problem { create( :problem ) }
    network { create( :network ) }
    location { create( :location ) }
  end
end
