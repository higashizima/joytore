class CreateDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :details do |t|

      t.timestamps
      t.integer :training_record_id, null: false
      t.integer :menu_id, null: false
      t.integer :weight, null: false
      t.integer :rep, null: false
      t.integer :set, null: false
      
    end
  end
end
