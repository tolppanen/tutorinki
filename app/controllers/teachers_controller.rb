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
		#Find relevan teachers, the query should include subject and level presented as integers correspnding
		#to specific values in the Skill-model
		@query = params[:subject_query]
		@results = User.where(teacher: true).all
		if @query != nil
		 if @query != ""
			@query = params[:subject_query]
			@subject = Subject.where(:name => @query).last
			@results = @subject.users.where(teacher: true).all
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
