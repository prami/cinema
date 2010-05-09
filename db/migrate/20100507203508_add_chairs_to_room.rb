class AddChairsToRoom < ActiveRecord::Migration
  def self.up
    add_column :rooms, :chairs, :text
  end

  def self.down
    remove_column :rooms, :chairs
  end
end
