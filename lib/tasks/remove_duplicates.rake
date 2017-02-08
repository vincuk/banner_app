require 'csv'

namespace :db do
  task :remove_duplicates => :environment do
    grouped = Impression.all
        .group_by{|impression| [impression.banner_id, impression.campaign_id]}
    grouped.values.each do |duplicates|
      first_one = duplicates.shift # or pop for last one
      duplicates.each{|double| double.destroy}
    end
  end
end