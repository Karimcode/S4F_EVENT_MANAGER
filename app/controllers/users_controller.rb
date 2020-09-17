class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    authorize @user
    balance_training
    @events = Event.all
    @daily_emotions = DailyEmotion.all
    # @daily_emotion = DailyEmotion.find_by(user_id: @user.id, event_id: @events.id)

    # @dailynumber = @daily_emotion.map { |emo| [emo.created_at, emo.emotion.number] }


  end

  def edit
    @user = current_user
    authorize @user
    @users = User.all

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

  def balance_training
  # Ajoutez une colonne training number à User et ajouter 4 ou 8 à chaque nouvelle
  # validation de formules.
    if !@user.coach
      if @user.formula
        if @user.formula.end_at < Time.now
            @user.training_number = "0"
        end
      end
    end
  @user.save
  # binding.pry
# lorsque Date.now = end_at => training number =0
# lorsque DailyEmotion est crée pour un user dans event, training number -=1
  end
end
