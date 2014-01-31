class PlayImporter
  def initialize(file)
    @doc = Nokogiri::XML::Document.parse(file)
  end

  def import
    create_play
    create_scenes

  end

  private

  def create_play
    Play.create(title: play_title)
  end

  def play_title
    @doc.xpath('//TITLE').text
  end

  def create_scenes
    @doc.xpath('//SCENE').each do |scene|
      # magic
      scene_model = create_scene(params) # more magic
      create_speechs(scene_model, scene)
    end
  end

  def create_speeches
    @doc.xpath('//SPEECH').each do |speech|
      # magic
      speech_model
      find_or_create_speker(speech, speech_model)
    end
  end
end

class Play < ActiveRecord::Base
  def create_scenes(doc)
    scenes << SceneBuilder.create_from(doc)
  end
end

class Scene < ActiveRecord::Base
  def create_speaker(doc)
    speakers << SpeakerBuilder.create_from(doc)
  end
end
