require 'spec_helper'

describe Line do
  it { should have_valid(:speech_id).when(1) }
  it { should_not have_valid(:speech_id).when(nil) }

  it { should have_valid(:line).when("Set him before me; let me see his face.") }
  it { should_not have_valid(:line).when(nil) }

  it { should belong_to :speech }
end
