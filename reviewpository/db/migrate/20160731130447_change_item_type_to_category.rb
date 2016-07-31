class ChangeItemTypeToCategory < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :type, :category
  end
end
