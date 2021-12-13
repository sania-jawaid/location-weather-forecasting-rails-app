class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.decimal :lattitude, :precision => 15, :scale => 13
      t.decimal :longitude, :precision => 15, :scale => 13
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
