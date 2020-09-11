class EventsController < ApplicationController
  def index
        @events = Event.all
  end

  def show
      @event = Event.find(params[:id])
      @place = Place.find(@event.place_id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)

    if @event.save
      redirect_to root_url
    end

  end



  # GET /events/:id/edit
  def edit
    @event = Event.find(params[:id])
  end

  # PUT events/:id/edit
  def update
    @event = Event.find(params[:id])
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
    @event.destroy
    # redirect_to user_path(current_user)
    redirect_to events_path

  end

private

  def event_params
    params.require(:event).permit(:title, :event_date, :duration)
  end


end
