require 'spec_helper'

describe PlayImporter do
  it 'creates a play model' do
    importer = PlayImporter.new(file('julius_caesar_test.xml'))
    expect do
      importer.import
    end.to change(Play, :count).by(1)
  end
 def file(file_name)
    Rack::Test::UploadedFile.new(Rails.root.join('spec','test_parse', file_name), 'text/csv')
  end
end
