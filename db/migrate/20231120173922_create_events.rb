class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :venue
      t.text :menu
      t.string :cuisine
      t.float :price
      t.text :description
      t.integer :capacity
      t.date :date

      t.timestamps
    end
  end
end
