require 'spec_helper'
require_relative '../../models/paragraph_generator.rb'

describe ParagraphGenerator do
  describe '#output' do
    before do
      paragraph_generator = ParagraphGenerator.new(3)
      @output = paragraph_generator.output
    end

    it 'outputs the requested amount of paragraphs' do
      @output.count.should == 3
    end

    it 'returns paragraphs that are all the minimum length' do
      lengths = @output.map { |paragraph| paragraph.length }

      lengths.each { |l| l.should >= ParagraphGenerator::MINIMUM_CHARACTER_COUNT }
    end
  end
end
