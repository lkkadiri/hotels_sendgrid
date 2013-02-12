class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :bedrooms
      t.integer :beds
      t.integer :nightly_rate
      t.boolean :booking_status
      t.boolean :television
      t.boolean :fridge
      t.boolean :microwave
      t.boolean :smoke_free
      t.boolean :sauna
      t.references :hotel

      t.timestamps
    end
    add_index :rooms, :hotel_id
  end
end
