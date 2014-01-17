require 'nokogiri'
require 'open-uri'

@speakers = []
file = File.open("lib/files/julius_caesar.xml")
doc = Nokogiri::XML::Document.parse(file)
file.close
@speeches = doc.xpath('//SPEECH')
@scenes = doc.xpath('//SCENE')

@scenes.each do |scene|
  title = scene.search('TITLE').text
  scene_obj = Scene.find_or_create_by(title: title)
  speech_obj = Speech.find_or_create_by(scene_id: scene_obj.id)
  @speeches.each do |speech|
    speaker = speech.search('SPEAKER').text
    Speaker.find_or_create_by(speech_id: speech_obj.id, name: speaker)
    binding.pry
    speech.search('LINE').each do |l|

    end
  end
end

