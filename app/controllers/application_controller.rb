class ApplicationController < ActionController::Base
  helper_method :current_path

  def current_path
    url_for(controller: controller_name, action: action_name, only_path: true)
  end
end
