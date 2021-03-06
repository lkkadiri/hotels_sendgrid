class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.integer :adults
      t.integer :children
      t.references :room
      t.references :user

      t.timestamps
    end
    add_index :reservations, :room_id
    add_index :reservations, :user_id
  end
end
