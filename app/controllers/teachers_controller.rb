class TeachersController < ApplicationController
	def show
		@teacher_id = params[:id]
	end

	def index
		#Find relevan teachers, the query should include subject and level presented as integers correspnding
		#to specific values in the Skill-model
		@allteachers = User.where(teacher: true)
		#@teachers = @allteachers.includes(:skills).where(skills: { subject: 'params[:subject]', level: 'params[:level]'  })
	end

end
