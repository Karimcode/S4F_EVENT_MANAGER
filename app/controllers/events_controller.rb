class EventsController < ApplicationController
  def index
        # @events = Event.all
        @events = policy_scope(Event)
        @daily_emotions = policy_scope(DailyEmotion)

    # @formulas = policy_scope(Formula)

    @formula = Formula.new
    # authorize @formula

    @users = User.all
    @user = current_user


  end

  def show
      @event = Event.find(params[:id])
      authorize @event

      @place = Place.find(@event.place_id)
      @daily_emotion = DailyEmotion.new
      authorize @daily_emotion

      @users = User.all
      @coaches = Coach.all
      @user = current_user

  end

  def new
    @event = Event.new
    authorize @event

    @daily_emotion = DailyEmotion.new(event_id: 'Event.find(params[:id])')
    authorize @daily_emotion

  end

  def create
    @event = Event.create!(event_params)
    authorize @event


    # @daily_emotion = DailyEmotion.create!(daily_emotion_params)


    if @event.save
      redirect_to events_path
    end

    # if @daily_emotion.save
    #   redirect_back(fallback_location:"/")
    # end
  end



  # GET /events/:id/edit
  def edit
    @event = Event.find(params[:id])
    authorize @event

  end

  # PUT events/:id/edit
  def update
    @event = Event.find(params[:id])
    authorize @event

    if @event.update(event_params)
      flash[:success] = "Update Event Success!"
           redirect_to event_path(@event.id)
    else
      @event.errors.full_messages.each do |message|
      flash[:error] = message
      end
      render :show
    end

  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
    # redirect_to user_path(current_user)
    redirect_to events_path

  end

private

  def event_params
    params.require(:event).permit(:title, :event_date, :duration, :place_id)
  end

  def place_params
  end


end
