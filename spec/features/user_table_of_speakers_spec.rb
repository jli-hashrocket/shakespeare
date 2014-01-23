require 'spec_helper'
require_relative '../../db/seeds.rb'

feature 'user sees table of roles', %q{
  As a user,
  I want to see a table of roles,
  So I can see the characters of the play
} do

  scenario 'goes to the index page' do
    xml_parse
    visit root_path
    within("#myTable") do
      page.should have_content("FLAVIUS")
      page.should have_content("26")
      page.should have_content("10")
      page.should have_content("1")
      page.should have_content("6%")
    end
  end

end
