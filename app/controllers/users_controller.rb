class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = Event.all
      # @event = Event.find(params[:id])

  end

  def edit
    @user = current_user
    current_user
  end
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :email, :job, :company, :phone, :description)
  end
end
