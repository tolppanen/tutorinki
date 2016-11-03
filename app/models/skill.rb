class Skill < ApplicationRecord
  belongs_to :user
  enum subject: [ :math, :english, :programming, :scala, :physics]
  enum level: [ :ala_aste, :yla_aste, :lukio, :paasykoe, :yliopisto ]
end
