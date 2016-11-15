class RenameGroupsUsersToGroupUsers < ActiveRecord::Migration[5.0]
  def change
    rename_table :groups_users, :group_users
  end
end
