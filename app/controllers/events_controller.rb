class EventsController < ApplicationController

  before_action :page_ids, only: :index

  def index
    @events = Event.where(page_id: page_ids)
    @pages = Page.order(name: :asc)
  end

  def facebook
  end

  private

    def page_ids
      params[:page_ids]
    end

end
