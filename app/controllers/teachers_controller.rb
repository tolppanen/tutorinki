class TeachersController < ApplicationController

	def show
		@teacher = User.find(params[:id])
		if @teacher.teacher?
			@comments = Comment.where(target_id: params[:id]).reverse
			@newcomment = Comment.new
			@newlike = Like.new
			@friendship = Friendship.new
			@picture = @teacher.avatar
			@allsubjects = @teacher.subjects
			@subjects = @teacher.subjects.pluck(:name).uniq
		else
			redirect_to root_path
		end
	end

	def index
		#Find relevant teachers, the query should include subject and level presented as integers correspnding
		#to specific values in the Skill-model
		@query = params[:subject_query]
		@detail = params[:detail_query]
		@resultarray = []
		@subjects = []
		@results = User.where(teacher: true).all
		if @query != nil
			if @query != ""
				@query.downcase!
				if @detail != ""
					@subject = Subject.where("name LIKE :search", search: "%#{@query}%").where("detail LIKE :search", search: "%#{@detail}%").first
					@subject.users.where(teacher: true).all.each do |u|
						@resultarray << u
					end
				else
					@subjects = Subject.where("name LIKE :search", search: "%#{@query}%").all
					@subjects.each do |s|
						s.users.where(teacher: true).all.each do |u|
							if !@resultarray.include?(u)
							@resultarray << u
						 end
						end
					end
					puts @resultarray.size
				end
				if @subject == nil
					@results = User.where(teacher: true).all
				end
					#@results = @subject.users.where(teacher: true).all
					puts @resultarray
					@results = @resultarray
				end
			end
		end



	def bio
		if current_user.teacher?
			@teacher = current_user
			@skills = @teacher.skills
			@newskill = Skill.new
		else
			redirect_to root_path
		end
	end

	def save
		puts "==============="
		puts params
		current_user.update!(bio: params[:user][:bio], city: params[:user][:city])
		redirect_to :controller => 'teachers', :action => 'bio'
	end

end
