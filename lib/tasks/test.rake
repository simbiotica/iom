namespace :db do

  namespace :structure do
    Rake::Task["db:structure:dump"].clear
    
    desc 'Dump the database schema as SQL.'
    task :dump do
      `rm -f db/#{Rails.env}_structure.sql`
      `pg_dump -s iom_#{Rails.env} > db/#{Rails.env}_structure.sql`
    end
  end

  namespace :test do
    Rake::Task["db:test:prepare"].clear

    desc 'Prepare the database for testing.'
    task :prepare => :environment do
      Rails.env = 'test'
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['iom:postgis_init'].invoke
      Rake::Task['db:schema:load'].invoke
      Rake::Task['iom:tiger_init'].invoke
    end

  end
end
