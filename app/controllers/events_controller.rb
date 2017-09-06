class EventsController < ApplicationController

  before_action :page_ids, only: :index

  helper_method :checked?

  def index
    @events = Event.month(month_param)
  end

  def show
    @events = Event.day(params[:day])
  end

  def list
    @events = Event.month(params[:month]).order(started_at: :desc)
  end

  def embed
    @events = Event.where(page_id: page_ids).order(started_at: :desc)
    @pages = Page.order(name: :asc)
    render :embed, layout: 'embed'
  end

  private

    def month_param
      m = params[:month]
      return Date.today.strftime("%B").downcase if m.nil? || m.empty?
      m.downcase
    end

    def page_ids
      params[:page_ids] || []
    end

    def checked?(id)
      return false if id.nil?
      return true if page_ids.include? id.to_s
      false
    end

end
