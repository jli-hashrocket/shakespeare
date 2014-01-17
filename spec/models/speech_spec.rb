require 'spec_helper'

describe Speech do
  it { should have_valid(:scene_id).when(1) }
  it { should_not have_valid(:scene_id).when(nil) }

  it { should have_many :speakers }
  it { should belong_to :scene }
  it { should have_many :lines }
end
