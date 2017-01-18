class EventsController < ApplicationController

  before_action :first_visit?

  before_action :page_ids, only: :index

  helper_method :checked?

  def index
    @events = Event.where(page_id: page_ids)
    @pages = Page.order(name: :asc)
    @output = cookies.permanent[:first_visit?]
  end

  protected

    def default_url_options
      if first_visit?
        super.merge page_ids: Page.all.pluck(:id)
      else
        super.merge page_ids: page_ids
      end
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

    def first_visit?
      if cookies.permanent[:first_visit?] == nil
        cookies.permanent[:first_visit?] = false
        true
      else
        false
      end
    end

end
