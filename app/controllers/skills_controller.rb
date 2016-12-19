class SkillsController < ApplicationController
  def destroy
    puts params
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to :back
  end

  def create
    puts params
    subject = Subject.where(name: params[:skill][:subject].downcase, detail: params[:skill][:description].downcase).first
    Skill.create!(user: current_user, subject: subject)
    redirect_to :back
  end

end
