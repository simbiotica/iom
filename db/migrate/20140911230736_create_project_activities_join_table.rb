class CreateProjectActivitiesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :projects_activities, :id => false do |t|
      t.integer :activity_id
      t.integer :project_id
    end
    add_index :projects_activities, :activity_id
    add_index :projects_activities, :project_id
  end

  def self.down
    drop_table :projects_activities
  end
end
