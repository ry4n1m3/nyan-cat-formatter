require 'spec_helper'

describe PaddedStringIO do
  let(:subject) { PaddedStringIO.new }

  it 'every puts clears the line to the right so no cat parts show up' do
    arg = "this is a test string"
    $stdout.should_receive(:puts).with(arg + "\e[0K")
    subject.puts(arg)
  end
end