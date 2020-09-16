class DailyEmotionsController < ApplicationController
  def index
        @daily_emotions = policy_scope(DailyEmotion)

        # @daily_emotions = DailyEmotion.all
        daily_emotion = User.find(params[:id])
  end



  def create
    # @event = Event.last
    @daily_emotion = DailyEmotion.create!(daily_emotion_params)
    authorize @daily_emotion

    # @daily_emotion.event_id = Event.find(params[:id])
      # redirect_back(fallback_location:"/")

    # respond_to do |f|
    #   f.html { redirect_back(fallback_location:"/") }
    #   f.js { render 'daily_emotion' }
    # end

    @daily_emotion.user = current_user

  end

  def destroy
    @daily_emotion = daily_emotion.find(params[:id])
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

end
