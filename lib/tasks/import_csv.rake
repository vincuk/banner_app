require 'csv'

namespace :db do
  task :import_csv => :environment do
    Impression.transaction do
      impressions = CSV.read("db/tmp/impressions.csv")
      columns = [:banner_id, :campaign_id]
      Impression.import columns, impressions, validate: false
    end
    
    Click.transaction do
      clicks = CSV.read("db/tmp/clicks.csv")
      columns = [:click_id, :banner_id, :campaign_id]
      Impression.import columns, clicks, validate: false
    end
  end
end