class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :skills
  has_many :subjects, through: :skills
  has_many :posted_comments, :class_name => 'Comment', :foreign_key => 'poster_id'
  has_many :rreceived_comments, :class_name => 'Comment', :foreign_key => 'target_id'
  has_friendship
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


end
