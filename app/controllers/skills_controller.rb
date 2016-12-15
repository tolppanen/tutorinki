class SkillsController < ApplicationController
  def destroy
    puts params
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to :back
  end
end
