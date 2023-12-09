class CreateGyms < ActiveRecord::Migration[6.1]
  def change
    create_table :gyms do |t|
      t.string :gym_name, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.integer :fee, null: false
      t.boolean :is_open, null: false, default:true

      t.timestamps
    end
  end
end
