class Line < ActiveRecord::Base
  validates_presence_of :speech_id
  validates_presence_of :line
  validates_uniqueness_of :line

  belongs_to :speech,
    inverse_of: :lines,
    counter_cache: true
  belongs_to :speaker,
    inverse_of: :lines
end
