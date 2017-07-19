FactoryGirl.define do
  factory :book do
    title "MyString"
    author "MyString"
    isbn 978982763
    jacket "MyString"
    borrowed false
    description "MyString"
    user_id 1
  end
end
