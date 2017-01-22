require 'rest-client'
require 'json'

module Facebook
  class User
    attr_accessor :facebook_id

    def initialize(facebook_id)
      @facebook_id = facebook_id
    end

    def import_all_events
      json = JSON.parse(RestClient.get(request))
      json['user-events']['data'].each do |event|
        if !::Event.exists?(facebook_id: event['id'])
          ::Event.create!(
            facebook_id: event['id'],
            page_id: page.id,
            title: event['name'],
            description: event['description'],
            started_at: event['start_time'],
            ended_at: event['end_time'])
        end
      end
    end

    private

      def access_token
        "access_token=#{ENV['FACEBOOK_APP_ACCESS_TOKEN']}"
      end

      def protocol
        'https'
      end

      def url
        'graph.facebook.com'
      end

      def version
        'v2.8'
      end

      def request
        "#{protocol}://#{url}/#{version}/#{@facebook_id}?#{query}&#{access_token}"
      end

      def query
        "fields=user-events{#{attributes}}"
      end

      def attributes
        [:start_time, :end_time, :description, :name, :id].join(',')
      end

  end
end
