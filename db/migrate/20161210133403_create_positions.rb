class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :longitude
      t.string :latitude
      t.integer :heading
      t.string :timestampofrecord
      t.uuid :vehicle_id
      t.timestamps null: false
    end
  end
end
