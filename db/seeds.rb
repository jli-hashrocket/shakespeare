require 'nokogiri'
require 'open-uri'

@speakers = []
file = File.open("lib/files/julius_caesar.xml")
doc = Nokogiri::XML::Document.parse(file)
file.close
@speeches = doc.xpath('//SPEECH')
@speeches.each do |speech|
  speaker = speech.search('SPEAKER').text

  lines = []
  speech.search('LINE').each do |l|
    lines << l.text
  end
binding.pry

end
