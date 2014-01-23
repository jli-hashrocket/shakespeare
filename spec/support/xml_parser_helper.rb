module XmlParse
  def xml_parse
    file = File.open(Rails.root.join( "spec/test_parse/julius_caesar_test.xml"))
    doc = Nokogiri::XML::Document.parse(file)
    file.close

    feed = XmlFeed.new(doc)
    feed.feed_data
  end
end
