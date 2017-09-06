class EventsController < ApplicationController

  before_action :page_ids, only: :index

  helper_method :checked?

  def index
    @events = Event.where(page_id: page_ids)
    @pages = Page.order(name: :asc)
  end

  def list
    @events = Event.where(page_id: page_ids).order(started_at: :desc)
    @pages = Page.order(name: :asc)
  end

  def embed
    @events = Event.where(page_id: page_ids).order(started_at: :desc)
    @pages = Page.order(name: :asc)
    render :embed, layout: 'embed'
  end

  protected

    def default_url_options
      super.merge page_ids: page_ids
    end

  private

    def page_ids
      if cookies.permanent[:first_visit?].nil?
        cookies.permanent[:first_visit?] = false
        params[:page_ids] = Page.all.collect(&:id).map(&:to_s)
      else
        params[:page_ids] || []
      end
    end

    def checked?(id)
      return false if id.nil?
      return true if page_ids.include? id.to_s
      false
    end

end
