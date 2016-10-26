class Group < ApplicationRecord
  has_many :users, through: :groups_users
  has_many :messages
end
