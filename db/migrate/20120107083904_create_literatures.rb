class CreateLiteratures < ActiveRecord::Migration
  def change
    create_table :literatures do |t|
      t.string :name
      t.integer :publisher_id
      t.integer :category_id
      t.integer :subcategory_id
      t.integer :published_year
      t.integer :quantity

      t.timestamps
    end
  end
end
