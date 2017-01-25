namespace :events do
  desc "creates events from facebook for all pages"
  task create_from_facebook: :environment do

    Page.all.each do |page|
      page.import_all_events
    end
  end

  desc "updates events from facebook for all pages"
  task update_from_facebook: :environment do

    Page.all.each do |page|
      page.update_all_events
    end
  end

end
