# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contractor do
    email 'asdf@jlk.com'
    password 'please'
    password_confirmation 'please'
    confirmed_at DateTime.now.utc
    name 'contractorio'
  end
end
