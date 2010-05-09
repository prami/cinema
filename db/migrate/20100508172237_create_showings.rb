class CreateShowings < ActiveRecord::Migration
  def self.up
    create_table :showings do |t|
      t.integer :film_id, :null => false
      t.integer :room_id, :null => false
      t.date :date, :null => false
      t.time :time, :null => false
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :showings
  end
end
