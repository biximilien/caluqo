require 'koala'
require 'rest-client'

class RootController < ApplicationController
  def index
    @events = Event.all

    @pages = Page.all

    @oauth = Koala::Facebook::OAuth.new(ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], nil)

    # generate authenticating URL
    code = @oauth.url_for_oauth_code
    # fetch the access token once you have the code
    @oauth.get_access_token(code)

    # facebook
  end

  private

    # def facebook
    #   @pages.each do |page|
    #     protocol = 'https://'
    #     facebook_url = 'graph.facebook.com'
    #     version = '/v2.8'
    #
    #     # @output = RestClient.get "#{protocol}#{facebook_url}#{version}/#{page.page_id}?fields=events{start_time,end_time,description,name,id}", headers={ access_token: ''}
    #   end
    # end

end
