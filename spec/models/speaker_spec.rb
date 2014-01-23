require 'spec_helper'

describe Speaker do
  it { should validate_presence_of(:name) }

  it { should have_many :speeches }
  it { should have_many(:lines).through(:speeches) }
  it { should have_many(:scenes).through(:speeches) }

  it 'returns the longest speech for each speaker' do
    xml_parse
    speakers = Speaker.all
    speeches = Speech.all
    speakers.each do |speaker|
      expect(speaker.longest_speech).to be_instance_of(Speech)
    end
  end

  it 'returns the percentage each speaker shows in scenes' do
    xml_parse
    speakers = Speaker.all
    speakers.each do |speaker|
      expect(speaker.scene_percent).to be_instance_of(String)
    end
  end

  it 'returns numbers of scenes each speaker appears in' do
    xml_parse
    scene_numbers = Speaker.scene_numbers
    scene_numbers.each do |scene_number|
      expect(scene_number).to be_instance_of(Hash)
    end
  end

end
