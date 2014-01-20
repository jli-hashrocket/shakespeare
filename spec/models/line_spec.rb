require 'spec_helper'

describe Line do
  it { should validate_presence_of(:speech_id) }
  it { should validate_presence_of(:line) }
  it { should validate_uniqueness_of(:line) }

  it { should belong_to :speech }
end
