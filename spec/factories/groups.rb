FactoryGirl.define do

  factory :group do
    title { Faker::Lorem.word }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }

    after(:create) do |group|
      create(:group_user, group: group, user: create(:user))
    end
  end

  factory :user do
    name                 { Faker::Lorem.word }
    email                { Faker::Internet.email }
    password              "00000000"
    password_confirmation "00000000"
  end

  factory :group_user do
    group
    user
  end
end
