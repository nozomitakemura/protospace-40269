class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
    #user = User.find(params[:id])
  end

end
