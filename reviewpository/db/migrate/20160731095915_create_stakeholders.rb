class CreateStakeholders < ActiveRecord::Migration[5.0]
  def change
    create_table :stakeholders do |t|

      t.timestamps
    end
  end
end
