class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title,        null: false
      t.date :date,           null: false
      t.date :next
      t.text :review,         null: false
      t.integer :radio,       null: false
      t.integer :user_id,     foreign_key: true
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
