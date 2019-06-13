FactoryGirl.define do
  factory :user do
    first_name "Regine"
    last_name "Velasquez"
    email "regine@gmail.com"
    password "password"
    password_confirmation "password"
    location "MyString"
  end
end
