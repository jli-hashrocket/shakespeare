require 'nokogiri'
require 'open-uri'

class XmlFeed
  def initialize(doc)
    @scenes = doc.xpath('//SCENE')
    @speaker = doc.xpath('//SPEAKER')
  end

  def feed_data
    @scenes.each do |scene|
      title = scene.search('TITLE').text
      scene_obj = Scene.find_or_create_by(title: title)
      scene.search('SPEECH').each do |speech|
        speaker = speech.search('SPEAKER').text
        speaker_obj = Speaker.find_or_create_by( name: speaker )
        speech_obj = scene_obj.speeches.create( speaker_id: speaker_obj.id )
        speech.search('LINE').each do |l|
          Line.create(speech_id: speech_obj.id, line: l.text)
        end
      end
    end
  end
end

file = File.open("lib/files/julius_caesar.xml")
doc = Nokogiri::XML::Document.parse(file)
file.close

feed = XmlFeed.new(doc)
feed.feed_data


