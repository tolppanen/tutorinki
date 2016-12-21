class LikesController < ApplicationController
  def create
    skillsubject = params[:like][:subject]
    skilldeatail = params[:like][:detail]
    user = params[:like][:user]
    skill = user.skills.where(subject: skillsubject)
    skill.likes << Like.create!(user: current_user)
    redirect_to :back
  end
end
