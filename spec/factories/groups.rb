FactoryGirl.define do

  factory :group do
    title { Faker::Lorem.word }
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }

    after(:create) do |group|
      create(:group_user, group: group, user: User.first )
    end
  end
end
