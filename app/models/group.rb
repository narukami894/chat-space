class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  scope :newly, -> { order(created_at: :desc) }
  validates :title, presence: true
  accepts_nested_attributes_for :group_users

  def last_message
    messages.last.body
  end
end
