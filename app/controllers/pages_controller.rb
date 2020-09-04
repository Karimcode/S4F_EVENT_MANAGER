class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :testux ]

  def home
  end

  def testux
  end

end
