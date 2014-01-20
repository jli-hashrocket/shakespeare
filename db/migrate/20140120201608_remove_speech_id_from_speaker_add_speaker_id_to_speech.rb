class RemoveSpeechIdFromSpeakerAddSpeakerIdToSpeech < ActiveRecord::Migration
  def up
    add_column :speeches, :speaker_id, :integer, null:false
    remove_column :speakers, :speech_id
  end
  def down
    add_column :speakers, :speech_id, :integer, null:false
    remove_column :speeches, :speaker_id
  end
end
