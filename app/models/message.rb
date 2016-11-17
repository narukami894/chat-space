class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :body, presence: true

  def display_time
    updated_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end
