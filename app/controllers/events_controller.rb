class EventsController < ApplicationController

  before_action :page_ids, only: :index

  def index
    @events = Event.all
    @pages = Page.where.not(id: page_ids).order(name: :asc)
  end

  def facebook
  end

  private

    def page_ids
      params.slice[:page_ids]
    end

end
