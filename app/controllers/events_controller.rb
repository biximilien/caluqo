class EventsController < ApplicationController

  before_action :page_ids, only: :index

  helper_method :checked?, :first_visit?

  after_action :visited

  def index
    @events = Event.where(page_id: page_ids)
    @pages = Page.order(name: :asc)
  end

  def list
    @events = Event.where(page_id: page_ids)
    @pages = Page.order(name: :asc)
  end

  protected

    def default_url_options
      super.merge page_ids: page_ids
    end

  private

    def first_visit?
      return false if cookies[:visited?]
      return true
    end

    def visited
      cookies[:visited?] = true
    end

    def page_ids
      return Page.pluck(:id) if first_visit?
      params[:page_ids] || []
    end

    def checked?(id)
      return false if id.nil?
      return true if page_ids.include? id.to_s || first_visit?
      false
    end

end
