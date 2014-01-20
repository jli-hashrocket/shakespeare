require 'spec_helper'

describe Speaker do
  it { should have_valid(:speech_id).when(1) }
  it { should_not have_valid(:speech_id).when(nil) }

  it { should have_valid(:name).when("ARTEMIDORUS") }
  it { should_not have_valid(:name).when(nil) }

  it { should belong_to :speech }
  it { should have_many(:lines).through(:speech) }
end
