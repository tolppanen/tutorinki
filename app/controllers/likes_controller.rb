class LikesController < ApplicationController
  def create
    skillsubject = Subject.where(name: params[:like][:subject], detail: params[:like][:detail])
    user = User.find(params[:like][:user].to_i)
    skill = user.skills.where(subject: skillsubject).first
    if Like.where(user: current_user, skill: skill).empty?
      Like.create!(user: current_user, skill: skill)
    end
    redirect_to :back
  end
end
