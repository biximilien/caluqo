class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_path

  def current_path
    url_for(controller: controller_name, action: action_name, only_path: true)
  end
end
