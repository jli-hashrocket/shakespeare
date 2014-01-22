class AddsCounterToSpeech < ActiveRecord::Migration
  def up
    add_column :speeches, :lines_count, :integer, null: :false, default: 0
    add_index :speeches, :lines_count
  end

  def down
    remove_column :speeches, :lines_count
  end
end
