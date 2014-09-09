class AddSomeMissingColumns < ActiveRecord::Migration
  def up
    add_column :addrfeat, :the_geom, :line_string, :srid => 4269
    add_column :bg, :the_geom, :multi_polygon, :srid => 4269
    add_column :countries, :the_geom, :multi_polygon, :srid => 4326
    add_column :county, :the_geom, :multi_polygon, :srid => 4269
    add_column :cousub, :the_geom, :multi_polygon, :srid => 4269
    add_column :edges, :the_geom, :multi_line_string, :srid => 4269    
    add_column :faces, :the_geom, :multi_polygon, :srid => 4269    
    add_column :place, :the_geom, :multi_polygon, :srid => 4269
    add_column :projects, :the_geom, :geometry, :srid => 4326
    add_column :regions, :the_geom, :geometry, :srid => 4326
    add_column :sites, :geographic_context_geometry, :geometry, :srid => 4326
    add_column :state, :the_geom, :multi_polygon, :srid => 4269
    add_column :tabblock, :the_geom, :multi_polygon, :srid => 4269
    add_column :tract, :the_geom, :multi_polygon, :srid => 4269
    add_column :zcta5, :the_geom, :multi_polygon, :srid => 4269
  end

  def down
    remove_column :addrfeat, :the_geom
    remove_column :bg, :the_geom
    remove_column :countries, :the_geom
    remove_column :county, :the_geom
    remove_column :cousub, :the_geom
    remove_column :edges, :the_geom
    remove_column :faces, :the_geom
    remove_column :place, :the_geom
    remove_column :projects, :the_geom
    remove_column :regions, :the_geom
    remove_column :sites, :geographic_context_geometry
    remove_column :state, :the_geom
    remove_column :tabblock, :the_geom
    remove_column :tract, :the_geom
    remove_column :zcta5, :the_geom
  end
end
