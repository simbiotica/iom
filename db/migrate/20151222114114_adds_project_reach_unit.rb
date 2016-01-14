class AddsProjectReachUnit < ActiveRecord::Migration
  def self.up
    change_column :projects, :project_reach_unit, :string, :default => 'individuals'
  end
end
