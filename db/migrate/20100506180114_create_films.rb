class CreateFilms < ActiveRecord::Migration
  def self.up
    create_table :films do |t|
      t.string :title, :null => false
      t.string :director, :null => false
      t.string :cast, :null => false
      t.text :plot, :null => false
      t.string :genre, :null => false
      t.string :run_time, :null => false
      t.date :release
      t.boolean :version3d
      t.integer :limitation

      #t.timestamps
    end
  end

  def self.down
    drop_table :films
  end
end
