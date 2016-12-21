class SkillsController < ApplicationController
  def destroy
    puts params
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to :back
  end

  def create
    detail = params[:skill][:subject].downcase.partition('-').last
    name = params[:skill][:subject].downcase.partition('-').first
    puts "================="
    puts name
    subject = Subject.where(name: name, detail: detail).first
    if Skill.where(:user_id => current_user.id, :subject => subject).blank?
      Skill.create!(user: current_user, subject: subject)
    end
    redirect_to :back
  end

  def api
    @subjects = Subject.all
    render :json  => @subjects.to_json
  end

end
