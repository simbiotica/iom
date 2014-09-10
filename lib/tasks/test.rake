namespace :db do
  namespace :test do
  
    Rake::Task["db:test:prepare"].clear

    desc 'Prepare the database for testing.'
    task :prepare => :environment do
      Rails.env = 'test'
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['iom:postgis_init'].invoke
      Rake::Task['db:structure:load'].invoke
    end

  end
end
