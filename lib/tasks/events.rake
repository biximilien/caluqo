namespace :events do
  desc "creates events from facebook for all pages"
  task create_from_facebook: :environment do

    Page.all.each do |page|
      page.import_all_events
    end
  end

end
