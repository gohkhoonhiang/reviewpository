class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :star
      t.integer :like
      t.integer :dislike
      t.belongs_to :item
      t.belongs_to :user

      t.timestamps
    end
  end
end
