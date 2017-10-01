class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def shared_places
    @places = current_user.shared_places
  end

end
