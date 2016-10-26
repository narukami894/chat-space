class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      body :text
      image :text
      user_id :integer, null: false
      group_id :integer, null: false
      t.timestamps
    end
  end
end
