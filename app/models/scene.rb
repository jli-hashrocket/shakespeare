class Scene < ActiveRecord::Base
  validates_presence_of :title
  validates_uniqueness_of :title

  has_many :speeches,
    inverse_of: :scene
end
