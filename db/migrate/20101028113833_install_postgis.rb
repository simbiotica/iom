class InstallPostgis < ActiveRecord::Migration
  def self.up
#    ActiveRecord::Base.connection.execute "CREATE EXTENSION postgis; CREATE EXTENSION postgis_topology; CREATE EXTENSION fuzzystrmatch;  CREATE EXTENSION postgis_tiger_geocoder;"
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
