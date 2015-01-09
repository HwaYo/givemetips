class Comment < ActiveRecord::Base
  belongs_to :goal
  belongs_to :writer, class_name: 'User'
end
