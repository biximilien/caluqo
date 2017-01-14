class RootController < ApplicationController
  def index
    @events = Event.all
  end

  def facebook
  end

end
