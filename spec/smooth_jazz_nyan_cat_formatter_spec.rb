# -*- coding: utf-8 -*-
require 'spec_helper'
require 'stringio'

describe SmoothJazzNyanCatFormatter do
  before do
    rspec_bin = $0.split('/').last
    @output = StringIO.new
    if rspec_bin == 'rspec'
      @formatter = SmoothJazzNyanCatFormatter.new(@output)
      @example = RSpec::Core::ExampleGroup.describe.example
    else
      formatter_options = OpenStruct.new(:colour => true, :dry_run => false, :autospec => nil)
      @formatter = SmoothJazzNyanCatFormatter.new(formatter_options, @output)
      @example = Spec::Example::ExampleProxy.new("should pass")
      @formatter.instance_variable_set(:@example_group, OpenStruct.new(:description => "group"))
    end
    @formatter.start(2)
  end
  
  describe 'inherited behavior' do
    it 'should inherit from the NyanCatMusicFormatter' do
      @formatter.should be_a(NyanCatFormatter)
    end
  end

  describe 'passed, pending and failed' do
    before do
      @formatter.stub!(:tick)
    end

    describe 'example_passed' do
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
end
