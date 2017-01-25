require 'rest-client'
require 'json'

module Facebook
  class Page
    attr_accessor :facebook_id

    def initialize(facebook_id, id)
      @facebook_id = facebook_id
      @id = id
    end

    def import_all_events
      json = JSON.parse(RestClient.get(request))
      json['events']['data'].each do |event|
        if !::Event.exists?(facebook_id: event['id'])
          ::Event.create!(
            facebook_id: event['id'],
            page_id: @id,
            title: event['name'],
            description: event['description'],
            started_at: event['start_time'],
            ended_at: event['end_time'])
        end
      end
    end

    def import_all_events_shared_by

    end

    def update_all_events
      json = JSON.parse(RestClient.get(request))
      json['events']['data'].each do |event|
        if ::Event.exists?(facebook_id: event['id'])
          event = ::Event.find_by(facebook_id: event['id'])
          attributes = {}
          attributes[:title] = event['name'] if event.title != event['name']
          attributes[:description] = event['description'] if event.description != event['description']
          attributes[:started_at] = event['start_time'] if event.started_at != event['start_time']
          attributes[:ended_at] = event['end_time'] if event.ended_at != event['end_time']
          event.update!(attributes) unless attributes.empty?
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
        "fields=events{#{attributes}}"
      end

      def attributes
        [:start_time, :end_time, :description, :name, :id].join(',')
      end

  end
end
