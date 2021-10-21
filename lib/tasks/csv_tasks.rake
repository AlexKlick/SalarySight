require 'csv'

namespace :csv do
  task :import_salaries => :environment do
    CSV.foreach("db/data/salaries.csv", :headers => true) do |row|
      Salary.create!(row.to_hash)
    end
    ActiveRecord::Base.connection.reset_pk_sequence!('customers')
  end

  task import_all: :environment do
    Rake::Task['csv:import_salaries'].execute
  end
end
