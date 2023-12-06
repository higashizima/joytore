class CreateTrainingRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :training_records do |t|

      t.timestamps
      t.integer :user_id, null: false
      t.text :content
      
    end
  end
end
