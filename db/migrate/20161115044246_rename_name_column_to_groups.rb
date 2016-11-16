class RenameNameColumnToGroups < ActiveRecord::Migration[5.0]
  def change
    rename_column :groups, :name, :title
  end
end
