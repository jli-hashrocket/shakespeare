class Scene < ActiveRecord::Base
  has_many :speeches,
    inverse_of: :scene
end
