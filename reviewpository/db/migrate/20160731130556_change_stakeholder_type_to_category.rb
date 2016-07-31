class ChangeStakeholderTypeToCategory < ActiveRecord::Migration[5.0]
  def change
    rename_column :stakeholders, :type, :category
  end
end
