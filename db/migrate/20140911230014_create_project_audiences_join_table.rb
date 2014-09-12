class CreateProjectAudiencesJoinTable < ActiveRecord::Migration
  def self.up
    create_table :projects_audiences, :id => false do |t|
      t.integer :audience_id
      t.integer :project_id
    end
    add_index :projects_audiences, :audience_id
    add_index :projects_audiences, :project_id
  end

  def self.down
    drop_table :projects_audiences
  end
end
