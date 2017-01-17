class RootController < ApplicationController
  def index
    @events = Event.all
    @pages = Page.all.order(name: :asc)
  end

  def facebook
  end

end
