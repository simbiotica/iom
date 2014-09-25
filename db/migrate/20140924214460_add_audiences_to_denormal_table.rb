class AddAudiencesToDenormalTable < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      ALTER TABLE data_denormalization
        ADD COLUMN audiences text,
        ADD COLUMN audiences_ids integer[]
     SQL
  end

  def self.down
    execute <<-SQL
      ALTER TABLE data_denormalization
        DROP COLUMN IF EXISTS audiences,
        DROP COLUMN IF EXISTS audiences_ids
    SQL
  end
end
