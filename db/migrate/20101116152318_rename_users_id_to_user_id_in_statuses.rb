class RenameUsersIdToUserIdInStatuses < ActiveRecord::Migration
  def self.up
    rename_column :statuses, :users_id, :user_id
  end

  def self.down
  end
end
