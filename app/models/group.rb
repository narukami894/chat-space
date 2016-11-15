class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  validates :title, presence: true
  accepts_nested_attributes_for :group_users
end
