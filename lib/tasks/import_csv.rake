require 'csv'

namespace :db do
  task :import_csv => :environment do
    Impression.transaction do
      impressions = CSV.read("db/tmp/impressions.csv")
      columns = [:banner_id, :campaign_id]
      Impression.import columns, impressions, validate: false
    end
    Impression.destroy(1)
    
    Click.transaction do
      clicks = CSV.read("db/tmp/clicks.csv")
      columns = [:click_id, :banner_id, :campaign_id]
      Click.import columns, clicks, validate: false
    end
    Click.destroy(1)
    
    Conversion.transaction do
      conversions = CSV.read("db/tmp/conversions.csv")
      columns = [:conversion_id, :click_id, :revenue]
      Conversion.import columns, conversions, validate: false
    end
    Conversion.destroy(1)
  end
end