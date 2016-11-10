class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :poster, :class_name => "User"
  belongs_to :target, :class_name => "User"
end
