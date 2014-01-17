class Speaker < ActiveRecord::Base
  validates_presence_of :speech_id
  validates_presence_of :name

  belongs_to :speech,
    inverse_of: :speakers
end
