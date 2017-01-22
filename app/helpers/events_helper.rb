module EventsHelper
  def active?(action)
    current_page?(controller: :events, action: action.to_s)
  end
end
