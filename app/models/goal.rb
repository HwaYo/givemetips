class Goal < ActiveRecord::Base
  belongs_to :writer, class_name: 'User'
  has_many :comments
end