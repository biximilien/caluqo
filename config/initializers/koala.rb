# config/initializers/koala.rb
require 'koala'

Koala.configure do |config|
  config.graph_server = ENV['CALUQO_URL']
  # other common options are `rest_server` and `dialog_host`
  # see lib/koala/http_service.rb
end
