class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :phone
      t.string :email
      t.string :website
      t.boolean :pool
      t.boolean :gym
      t.boolean :hot_tub
      t.boolean :free_breakfast

      t.timestamps
    end
  end
end
