require 'nokogiri'
require 'open-uri'

class XmlFeed
  def initialize(doc)
    @speeches = doc.xpath('//SPEECH')
    @scenes = doc.xpath('//SCENE')
    @speaker = doc.xpath('//SPEAKER')
  end

  def feed_data
    @scenes.each do |scene|
      @speeches.each do |speech|
        title = speech.parent.search('TITLE').text
        scene_obj = Scene.find_or_create_by(title: title)

        speech.search('LINE').each do |l|
          speech_obj = Speech.find_or_create_by(scene_id: scene_obj.id)
          speaker = speech.search('SPEAKER').text
          Speaker.find_or_create_by(speech_id: speech_obj.id, name: speaker)
          Line.find_or_create_by(speech_id: speech_obj.id, line: l.text)
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


