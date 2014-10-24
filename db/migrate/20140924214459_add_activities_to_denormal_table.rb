class AddActivitiesToDenormalTable < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      ALTER TABLE data_denormalization
        ADD COLUMN activities text,
        ADD COLUMN activities_ids integer[]
     SQL
  end

  def self.down
    execute <<-SQL
      ALTER TABLE data_denormalization
        DROP COLUMN IF EXISTS activities,
        DROP COLUMN IF EXISTS activity_ids
    SQL
  end
end
