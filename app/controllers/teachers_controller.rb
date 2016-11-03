class TeachersController < ApplicationController
	def show
		@teacher_id = params[:id]
	end
end
