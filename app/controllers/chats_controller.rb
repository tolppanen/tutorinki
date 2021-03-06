class ChatsController < ApplicationController
  def show
    @chat = {}
    if !Chat.includes(:messages).find_by(student: params[:id], teacher: current_user).nil?
      @chat = Chat.includes(:messages).find_by(student: params[:id], teacher: current_user)
    else
      @chat = Chat.includes(:messages).find_by(student: current_user, teacher: params[:id])
    end
    @message = Message.new
  end
end
