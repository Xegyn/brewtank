FactoryGirl.define do
  factory :user do
    first_name 'Jessica'
    last_name 'Stearns'
    email 'jessica.sprague@example.com'
    password 'Password1'
    admin false
  end
  factory :admin, class: User do
    first_name 'Carlo'
    last_name 'Stearns'
    email 'carlo.stearns@example.com'
    password 'Password1'
    admin true
  end
end