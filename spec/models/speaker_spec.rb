require 'spec_helper'

describe Speaker do
  it { should validate_presence_of(:name) }

  it { should have_many :speeches }
  it { should have_many(:lines).through(:speeches) }
end
