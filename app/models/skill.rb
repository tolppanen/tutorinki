class Skill < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :subject
end
