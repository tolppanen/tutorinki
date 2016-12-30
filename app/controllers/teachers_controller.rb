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
		if params[:detailed] == true
		@query = params[:subject_query]
		@detail = params[:detail_query]
	else
		@query = params[:subject_query]
	end
		@resultarray = []
		@subjects = []
		@details = []
		@results = User.where(teacher: true).all
		if @query != nil && @query != ""
			@query.downcase!
			if @detail != nil && @detail != ""
				@subjects = Subject.where("name LIKE :search", search: "%#{@query}%").where(detail: @detail)
			else
				@subjects = Subject.where("name LIKE :search", search: "%#{@query}%").all
			end
			@subjects.each do |s|
				s.users.where(teacher: true).all.each do |u|
					if !@resultarray.include?(u)
						@resultarray << u
					end
				end
				puts @resultarray.size
			end
			if @subject == nil
				@results = User.where(teacher: true).all
			end
		else
			@resultarray = User.where(teacher: true).all
		end
			@details = Subject.where("name LIKE :search", search: "%#{@query}%").all
			@results = @resultarray.sort_by{ |t| t.total_likes }.reverse
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
		puts params[:user]
		current_user.update!(bio: params[:user][:bio], city: params[:user][:city], price: params[:user][:price])
		redirect_to :controller => 'teachers', :action => 'bio'
	end

end
