class Speech < ActiveRecord::Base
  validates_presence_of :scene_id

  has_many :speakers,
    inverse_of: :speech
  has_many :lines,
    inverse_of: :speech
  belongs_to :scene,
    inverse_of: :speeches
end
