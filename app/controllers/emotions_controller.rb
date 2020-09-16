class EmotionsController < ApplicationController

  def new
    @emotion = Emotion.find(params[:id])
  end

end
