class AddsRoleToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :string

    admin = User.find_by_id(1)
    if admin.present?
      admin.role = 'admin'
      admin.save!
    end
  end

  def self.down
    remove_column :users, :role
  end
end
