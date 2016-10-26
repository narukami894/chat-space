class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.body :text
      t.image :text
      t.user_id :integer, null: false
      t.group_id :integer, null: false
      t.timestamps
    end
  end
end
