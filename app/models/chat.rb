class Chat < ApplicationRecord
  belongs_to :teacher, :class_name => "User"
  belongs_to :student, :class_name => "User"
  has_many :messages, dependent: :destroy
end
