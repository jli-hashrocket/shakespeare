class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.integer :speech_id, null:false
      t.string :name, null:false

      t.timestamps
    end
  end
end
