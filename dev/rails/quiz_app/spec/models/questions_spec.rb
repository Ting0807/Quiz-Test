require 'spec_helper'

describe Questions do
  describe Question do
  it { should belong_to(:quiz) }
  it { should have_many(:answers) }
end
