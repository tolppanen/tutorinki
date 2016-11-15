class TeachersController < ApplicationController
	def show
		@teacher = User.find(params[:id])
		@comments = Comment.where(target_id: params[:id]).reverse
		@newcomment = Comment.new
		@friendship = Friendship.new
		@picture = @teacher.avatar
		@subjects = @teacher.subjects.pluck(:name).uniq
	end

	def index
		#Find relevant teachers, the query should include subject and level presented as integers correspnding
		#to specific values in the Skill-model
		@query = params[:subject_query]
		@results = User.where(teacher: true).all
		if @query != nil
		 if @query != ""
			@query = params[:subject_query]
			@subject = Subject.where(:name => @query).sample
			if @subject == nil
			 redirect_to root_path
		 else
			@results = @subject.users.where(teacher: true).all
	 end
end

	def contacts

	end
end
end
end
