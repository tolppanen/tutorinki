class FriendshipsController < ApplicationController

def create
  if user_signed_in?
    puts params[:friendship][:user]
    current_user.friend_request(User.find(params[:friendship][:user]))
  else
    redirect_to new_user_registration_path
  end
end

end
