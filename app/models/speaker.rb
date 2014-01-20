class Speaker < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :speeches,
    inverse_of: :speaker
  has_many :lines,
    through: :speeches

  def self.longest_speech
  end

  def scene_numbers
  end

  def total_scenes
  end
end
