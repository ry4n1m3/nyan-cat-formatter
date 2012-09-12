# -*- coding: utf-8 -*-
require 'spec_helper'
require 'stringio'
require 'smooth_jazz_nyan_cat_music_formatter'

describe SmoothJazzNyanCatMusicFormatter do
  let(:path_to_mp3) { @formatter.nyan_mp3 }
  let(:stdout)      { StringIO.new }
  let(:mock_kernel) { MockKernel.new }

  before do
    @formatter = nil
    rspec_bin = $0.split('/').last
    if rspec_bin == 'rspec'
      @formatter = SmoothJazzNyanCatMusicFormatter.new(stdout)
      @example = RSpec::Core::ExampleGroup.describe.example
    else
      formatter_options = OpenStruct.new(:colour => true, :dry_run => false, :autospec => nil)
      @formatter = SmoothJazzNyanCatMusicFormatter.new(formatter_options, stdout)
      @example = Spec::Example::ExampleProxy.new("should pass")
      @formatter.instance_variable_set(:@example_group, OpenStruct.new(:description => "group"))
    end
    @formatter.start(2)
    @formatter.kernel = mock_kernel
  end

  describe 'inherited behavior' do
    it 'should inherit from the NyanCatMusicFormatter' do
      @formatter.should be_a(NyanCatFormatter)
      @formatter.should be_a(NyanCatMusicFormatter)
    end
  end
  
  describe 'start' do
    context 'when on OS X' do
      before { @formatter.platform = 'darwin' }

      it 'plays the song in the background' do
        @formatter.start 3
        mock_kernel.seen.should include "afplay #{path_to_mp3} &"
      end
    end
  end
  
  describe 'example_passed' do
    before do
      @formatter.stub!(:tick)
    end
    
    it 'should relax Nyan Cat' do
      @formatter.example_passed(@example)
      @formatter.nyan_cat.should include [
        '_,------,   ',
        '_|  /\_/\ ',
        '~|_( ⌐■.■)  ',
        ' ""  "" '
      ].join("\n")
    end
  end
end
