include RandomData

FactoryGirl.define do
  pw = RandomData.random_word
  factory :user, class: User do
    id 1
    name RandomData.random_name
    email RandomData.random_email
    password pw
    password_confirmation pw
  end
end