class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user

    @events = Event.all
    @daily_emotions = DailyEmotion.all
    # @daily_emotion = DailyEmotion.find_by(user_id: @user.id, event_id: @events.id)

    # @dailynumber = @daily_emotion.map { |emo| [emo.created_at, emo.emotion.number] }


  end

  def edit
    @user = current_user
    authorize @user

    current_user
  end

  def update
    @user = current_user
    authorize @user

    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :avatar, :email, :job, :company, :phone, :description)
  end
end
