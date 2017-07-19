FactoryGirl.define do
  factory :user do
    sequence :username do |t|
      "MyString3{t}"
    end
    password_digest "MyString"
    first_name "Bob"
    last_name "Saggot"
  end
end
