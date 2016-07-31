class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :like
      t.integer :dislike
      t.belongs_to :review
      t.belongs_to :user

      t.timestamps
    end
  end
end
