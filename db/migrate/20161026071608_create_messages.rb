class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text       :body
      t.text       :image
      t.integer    :user_id,  null: false
      t.integer    :group_id, null: false
      t.timestamps
    end
  end
end
