class PreCalculateRegionsCentroids < ActiveRecord::Migration
  def self.up
    execute "UPDATE regions SET center_lat=st_y(ST_Centroid(the_geom)),center_lon=st_x(ST_Centroid(the_geom))"
    execute "UPDATE countries SET center_lat=st_y(ST_Centroid(the_geom)),center_lon=st_x(ST_Centroid(the_geom))"
  end

  def self.down
  end
end
