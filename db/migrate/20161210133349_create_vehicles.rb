class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles, {:id => false} do |t|
      t.uuid :id, :primary_key => true, null: false
      t.string :vtype
      t.timestamps null: false
    end
  end
end
