namespace :facebook do

  desc "import facebook events for all pages"
  task import_events: :environment do

    Page.all.each do |page|
      page.import_all_events
    end
  end

  desc "updates facebook events for all pages"
  task update_events: :environment do

    Page.all.each do |page|
      page.update_all_events
    end
  end

end
