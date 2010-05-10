class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.integer :showing_id
      t.text :chairs
      t.string :name
      t.string :surname
      t.string :phone
      t.string :ticket

      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end
