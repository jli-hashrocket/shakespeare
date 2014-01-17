class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :speech_id, null:false
      t.text :line, null:false

      t.timestamps
    end
  end
end
