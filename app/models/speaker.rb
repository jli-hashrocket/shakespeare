class Speaker < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :speeches,
    inverse_of: :speaker
  has_many :lines,
    through: :speeches
  has_many :scenes,
    -> { uniq },
    through: :speeches

  def longest_speech
    speeches.order(lines_count: :desc).first
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
