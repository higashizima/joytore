class AddStartTimeToTrainingRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :training_records, :start_time, :datetime
  end
end
