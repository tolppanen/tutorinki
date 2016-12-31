class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :skills
  has_many :subjects, through: :skills, :dependent => :destroy
  has_many :chats, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :posted_comments, :class_name => 'Comment', :foreign_key => 'poster_id', :dependent => :destroy
  has_many :received_comments, :class_name => 'Comment', :foreign_key => 'target_id', :dependent => :destroy
  has_friendship
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  def total_likes
    sum = 0
    self.skills.each do |s|
      sum += s.likes.count
    end
    return sum
  end


end
