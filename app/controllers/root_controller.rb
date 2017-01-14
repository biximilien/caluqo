require 'koala'
require 'rest-client'

class RootController < ApplicationController
  def index
    @events = Event.all

    @pages = Page.all

    @output = facebook_api
  end

  def facebook
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

    def facebook_api
      # @oauth = Koala::Facebook::OAuth.new(ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'], facebook_callback_url)

      # @graph = Koala::Facebook::API.new(ENV['FACEBOOK_APP_ACCESS_TOKEN'])

      # profile = @graph.get_object("me")
      # friends = @graph.get_connections("me", "friends")
      # @graph.put_connections("me", "feed", message: "I am writing on my wall!")

      # Three-part queries are easy too!
      # @graph.get_connections("me", "mutualfriends/#{friend_id}")

      # You can use the Timeline API:
      # (see https://developers.facebook.com/docs/beta/opengraph/tutorial/)
      # @graph.put_connections("me", "namespace:action", object: object_url)

      # For extra security (recommended), you can provide an appsecret parameter,
      # tying your access tokens to your app secret.
      # (See https://developers.facebook.com/docs/reference/api/securing-graph-api/
      # You'll need to turn on 'Require proof on all calls' in the advanced section
      # of your app's settings when doing this.
      @graph = Koala::Facebook::API.new(ENV['FACEBOOK_APP_ACCESS_TOKEN'], ENV['FACEBOOK_APP_SECRET'])

      # Facebook is now versioning their API. # If you don't specify a version, Facebook
      # will default to the oldest version your app is allowed to use. Note that apps
      # created after f8 2014 *cannot* use the v1.0 API. See
      # https://developers.facebook.com/docs/apps/versions for more information.
      #
      # You can specify version either globally:
      # Koala.config.api_version = "v2.8"
      # or on a per-request basis
      # @graph.get_object("433930240006398", {}, api_version: "v2.8")
      # @graph.get_object("433930240006398", "events")
      friends = @graph.get_connections("me", "friends")
    end

end
