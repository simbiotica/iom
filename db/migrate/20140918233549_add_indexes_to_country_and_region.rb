class AddIndexesToCountryAndRegion < ActiveRecord::Migration
  def self.up
    add_index :countries, :name
    add_index :regions, :name
  end
  def self.down
    remove_index :countries, :name
    remove_index :regions, :name
  end
end
