class Skill < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :subject
  has_many :likes
end
