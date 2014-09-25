namespace :iom do
  namespace :maintenance do

    desc 'Loads countries for projects without it'
    task :load_projects_countries => :environment do
      Project.with_no_country.find_each(:batch_size => 500) do |project|
        project.countries = project.regions.map(&:country).uniq! || []
        project.save!(false)
        print '.'
      end
    end

    desc 'Regenerates the physical caches of project information for all sites'
    task :regenerate_caches => :environment do
      Site.each { |s| s.set_cached_sites }
    end

  end
end
