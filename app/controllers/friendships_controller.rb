class FriendshipsController < ApplicationController

def create
  if user_signed_in?
    current_user.friend_request(User.find(params[:friendship][:user]))
  else
    redirect_to new_user_registration_path
  end
end

def index

end

def pending
  if user_signed_in?
    @pending = current_user.requested_friends
  end
end

def confirm
  current_user.accept_request(User.find(params[:id]))
  redirect_to contacts_path
end

end
