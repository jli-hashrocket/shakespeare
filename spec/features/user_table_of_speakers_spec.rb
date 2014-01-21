require 'spec_helper'
require_relative '../../db/seeds.rb'

feature 'user sees table of roles', %q{
  As a user,
  I want to see a table of roles,
  So I can see the characters of the play
} do

  scenario 'goes to the index page' do
    file = File.open(Rails.root.join( "spec/test_parse/julius_caesar_test.xml"))
    doc = Nokogiri::XML::Document.parse(file)
    file.close

    feed = XmlFeed.new(doc)
    feed.feed_data

    visit root_path
    within("#myTable") do
      page.should have_content("FLAVIUS")
      page.should have_content("26")
      page.should have_content("10")
    end
  end

end
