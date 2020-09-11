class EventsController < ApplicationController
  def index
        @events = Event.all
  end

  def show
      @event = Event.find(params[:id])
      @place = Place.find(@event.place_id)
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end




end
