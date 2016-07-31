class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :type
      t.belongs_to :user

      t.timestamps
    end
  end
end
