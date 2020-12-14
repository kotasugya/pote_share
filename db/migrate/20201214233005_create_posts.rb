class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :room_name
      t.text :room_PR
      t.integer :room_price
      t.datetime :start_day
      t.dateime :finish_day
      t.string :room_address

      t.timestamps
    end
  end
end
