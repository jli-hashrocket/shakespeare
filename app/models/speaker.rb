class Speaker < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :speeches,
    inverse_of: :speaker
  has_many :lines,
    through: :speeches
  has_many :scenes,
    through: :speeches,
    uniq: true

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

  def longest_speech

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
      scene_count = speaker.scenes.count
      speaker_hash[speaker.name] = scene_count
      speaker_scenes << speaker_hash
    end
    speaker_scenes
  end

  def scene_percent
    total_scenes = Scene.all.count
    scenes_appeared_in = scenes.count
    percent = scenes_appeared_in.to_f/total_scenes.to_f
    percent_per_speaker = (percent * 100).round.to_s + '%'
  end

end
