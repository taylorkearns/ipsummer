require 'debugger'
require 'spec_helper'
require_relative '../ipsum.rb'

describe Paragraph do
  describe '#generate' do
    context 'with no options' do
      it 'returns a paragraph with the default number of sentences' do
        paragraph = Paragraph.new

        p = paragraph.generate

        sentence_count(p).should be_within(5).of(5)
      end
    end

    context 'with only a minimum sentences option' do
      it 'returns a paragraph with at least the minimum number of sentences' do
        paragraph = Paragraph.new min_sentences: 5

        p = paragraph.generate

        sentence_count(p).should >= 5
      end
    end

    context 'with only a maximum sentences option' do
      it 'returns a paragraph with at most the maximum number of sentences' do
        paragraph = Paragraph.new max_sentences: 10

        p = paragraph.generate

        sentence_count(p).should <= 10
      end
    end

    context 'with maximum and minimum sentences options' do
      it 'returns a paragraph with at most the maximum number of sentences' do
        paragraph = Paragraph.new min_sentences: 7, max_sentences: 10

        p = paragraph.generate

        sentence_count(p).should >= 7 
        sentence_count(p).should <= 10
      end
    end
  end
end

def sentence_count(str)
  str.split(/\.\s/).count
end
