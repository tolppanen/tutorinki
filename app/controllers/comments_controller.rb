class CommentsController < ApplicationController
  def create
    comment = Comment.new(target_id: params[:comment][:target], poster_id: params[:comment][:poster], body: params[:comment][:body])
    if(comment.valid? and comment.save)
       flash[:notice] = "Thanks for showing interest, We'll be in touch with updates."
       redirect_to url_for(:controller => :teachers, :action => :show, :id => params[:comment][:target])
     else
        flash[:notice] = comment.errors.messages
        redirect_to url_for(:controller => :teachers, :action => :show, :id => params[:comment][:target])
     end
  end
end
