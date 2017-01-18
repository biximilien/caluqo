class EventsController < ApplicationController

  before_action :page_ids, only: :index

  helper_method :checked?

  def index
    @events = Event.where(page_id: page_ids)
    @pages = Page.order(name: :asc)
  end

  def facebook
  end

  protected

    def default_url_options
      { page_ids: page_ids }.merge(super)
    end

  private

    def page_ids
      params[:page_ids] || []
    end

    def checked?(id)
      return false if id.nil?
      return true if page_ids.include? id.to_s
      false
    end

end
