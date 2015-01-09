class Comment < ActiveRecord::Base
  belongs_to :goal
  belongs_to :writer, class_name: 'User'

  scope :order_by_recent, ->{ order(created_at: :desc) }

  validates :content, presence: true
end