class TeachersController < ApplicationController
	def show
		@teacher_id = params[:id]
	end

	def index
		#Find relevan teachers, the query should include subject and level presented as integers correspnding
		#to specific values in the Skill-model
		@query = params[:subject_query]
		if @query != nil
		if @query != ""
			@query = params[:subject_query]
			@subject = Subject.where(:name => @query).last
			@results = @subject.users.where(teacher: true).all
		else
			@results = User.where(teacher: true).all
		end
	end
	end

	def contacts
		 contacts = []
		 friendships = current_user.friendships
		 friendships.each do |f|
		 		contacts << User.find(f.friend_id)
		 end
		 @user_contacts = contacts
	end

end
