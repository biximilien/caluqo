require 'caluqo'

namespace :events do
  desc "creates events from facebook for all pages"
  task create_from_facebook: :environment do

    Page.all.each do |page|
      FacebookPage.new(page.id).import_all_events
    end
  end

end
