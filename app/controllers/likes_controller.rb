class LikesController < ApplicationController
  def create
  	puts params
    skillsubject = Subject.where(name: params[:like][:subject], detail: params[:like][:detail])
    user = User.find(params[:like][:user].to_i)
    skill = user.skills.where(subject: skillsubject).first
    Like.create!(user: current_user, skill: skill)
    redirect_to :back
  end
end
