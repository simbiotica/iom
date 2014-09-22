class CreateMedicineAndDiseaseJoinTables < ActiveRecord::Migration
  def self.up
    create_table :medicines_projects, :id => false do |t|
      t.integer :medicine_id
      t.integer :project_id
    end
    add_index :medicines_projects, :medicine_id
    add_index :medicines_projects, :project_id

    create_table :diseases_projects, :id => false do |t|
      t.integer :disease_id
      t.integer :project_id
    end
    add_index :diseases_projects, :disease_id
    add_index :diseases_projects, :project_id

  end

  def self.down
    drop_table :medicines_projects
    drop_table :diseases_projects
  end
end
