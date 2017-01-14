require 'rest-client'
require 'json'

namespace :events do
  desc "TODO"
  task create_from_facebook: :environment do
    access_token = ENV['FACEBOOK_APP_ACCESS_TOKEN']

    Page.all.each do |page|
      request = RestClient.get "https://graph.facebook.com/v2.8/#{page.page_id}?fields=events{start_time,end_time,description,name,id}&access_token=#{access_token}"
      json = JSON.parse(request)
      json['events']['data'].each do |event|
        Event.create!(facebook_id: event['id'], title: event['name'], description: event['description'], started_at: event['start_time'], ended_at: event['end_time'])
      end
    end
  end

end
