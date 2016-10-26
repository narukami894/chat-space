class CreateGroupsUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_users do |t|
      t.user_id :integer, null: false
      t.group_id :integer, null: false
      t.timestamps
    end
  end
end
