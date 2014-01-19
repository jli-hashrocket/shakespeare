require 'spec_helper'

feature 'user sees table of roles', %q{
  As a user,
  I want to see a table of roles,
  So I can see the characters of the play
} do

  scenario 'goes to the index page' do
    visit root_path
    expect(page).to have_content("JULIUS CAESAR")
  end

end
