class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :testux ]



  def home
    @places = Place.all
    @users = User.all
    @events = Event.all
    @user = current_user

  end

  def testux
  end

end
