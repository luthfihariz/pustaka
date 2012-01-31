class CreateWritings < ActiveRecord::Migration
  def change
    create_table :writings do |t|
      t.integer :literature_id
      t.integer :writer_id

      t.timestamps
    end
  end
end
