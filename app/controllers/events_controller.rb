class EventsController < ApplicationController

  before_action :sanitize_filters, only: :index

  def index
    @events = Event.all
    @pages = Page.all.order(name: :asc)
  end

  def facebook
  end

  private

    def sanitize_filters
      params.slice(:filter)
    end

end
