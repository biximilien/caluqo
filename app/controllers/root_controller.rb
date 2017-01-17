class RootController < ApplicationController
  def index
    @events = Event.all
    @pages = Page.all
  end

  def facebook
  end

end
