class Speaker < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :speeches,
    inverse_of: :speaker
  has_many :lines,
    through: :speeches
  has_many :scenes,
    through: :speeches

  # Creates an array of hashes of all speakers with the longest speech
  def self.longest_speech
    speech_lines = speeches_with_line_size
    speakers = Speaker.all
    speakers_lines = []
    speakers.each do |speaker|
      speech_lines.each do |speech_line|
        speaker_hash = {}
        if speaker.id == speech_line[:speaker_id]
          speaker_hash[speaker.name] = speech_line[:lines_size]
          speakers_lines << speaker_hash
        end
      end
    end
    speakers_lines = speakers_lines.group_by(&:keys).map{|k, v| {k.first => (v.flat_map(&:values)).max}}
  end

  # Creates an array of hashes of all speeches with speech_id,speaker_id,line_size attributes
  def self.speeches_with_line_size
    speeches = Speech.all
    speech_lines= []
    speeches.each do |speech|
      speech_lines_hash = {}
      speech_lines_hash[:speech_id] = speech.id
      speech_lines_hash[:speaker_id] = speech.speaker_id
      speech_lines_hash[:lines_size] = speech.lines.size
      speech_lines << speech_lines_hash
    end
    speech_lines
  end

  def self.scene_numbers
    speakers = Speaker.all
    speaker_scenes =  []
    speakers.each do |speaker|
      speaker_hash = {}
      scene = Scene.first
      scene_count = speaker.scenes.count
      speaker_hash[speaker.name] = scene_count
      speaker_scenes << speaker_hash
    end
    speaker_scenes
  end

  def total_scenes

  end
end
