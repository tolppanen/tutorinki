class Subject < ApplicationRecord
  has_many :skills
  has_many :users, through: :skills
end
