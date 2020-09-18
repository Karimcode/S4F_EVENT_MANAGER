class DailyEmotionsController < ApplicationController
  def index
        @daily_emotions = policy_scope(DailyEmotion)
        @users = User.all

        # @daily_emotions = DailyEmotion.all
        # daily_emotion = User.find(params[:id])
  end



  def create
    # @event = Event.last
    @daily_emotion = DailyEmotion.create!(daily_emotion_params)
    authorize @daily_emotion
    # @daily_emotion.user = current_user
    @user = User.find(@daily_emotion.user_id)

    if @daily_emotion.save
         training_number_calculation
     end

  end

  def destroy
    @daily_emotion = DailyEmotion.find(params[:id])
    authorize @daily_emotion

    @daily_emotion.destroy
    redirect_to daily_emotions_path
  end

  def new
    @daily_emotion = DailyEmotion.new(event_id: event_number )
    authorize @daily_emotion

  end



  private

  def daily_emotion_params
    params.require(:daily_emotion).permit(:emotion_id, :user_id, :event_id)
  end

  def training_number_calculation
    @user_training = @user.training_number

    @user_training = @user_training - 1
    @user.training_number =  @user_training
    @user.save
  end
end
