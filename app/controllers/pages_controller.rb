class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :testux ]

  def home
    @places = Place.all
    @users = User.all

  end

  def testux
  end

end
