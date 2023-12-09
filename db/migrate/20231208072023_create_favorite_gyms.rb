class CreateFavoriteGyms < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_gyms do |t|
      t.integer :user_id, null: false
      t.integer :gym_id, null: false

      t.timestamps
    end
  end
end
