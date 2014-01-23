require 'spec_helper'

describe Scene do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }

  it { should have_many :speeches }
  it { should have_many(:speakers).through(:speeches)}
end
