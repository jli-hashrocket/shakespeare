class Speech < ActiveRecord::Base
  validates_presence_of :scene

  belongs_to :speaker,
    inverse_of: :speeches
  has_many :lines,
    inverse_of: :speech
  belongs_to :scene,
    inverse_of: :speeches


end
