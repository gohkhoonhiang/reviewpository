class CreateStakeholders < ActiveRecord::Migration[5.0]
  def change
    create_table :stakeholders do |t|
      t.string :name
      t.string :type
      t.belongs_to :item

      t.timestamps
    end
  end
end
