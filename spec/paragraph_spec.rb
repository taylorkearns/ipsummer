require 'spec_helper'
require_relative '../paragraph.rb'

describe Paragraph do
  describe '#text' do
    context 'with no options' do
      it 'returns a paragraph with the default number of sentences' do
        paragraph = Paragraph.new
        t = paragraph.text

        sentence_count(t).should be_within(5).of(5)
      end
    end

    context 'with only a minimum sentences option' do
      it 'returns a paragraph with at least the minimum number of sentences' do
        paragraph = Paragraph.new min_sentences: 5
        t = paragraph.text

        sentence_count(t).should >= 5
      end
    end

    context 'with only a maximum sentences option' do
      it 'returns a paragraph with at most the maximum number of sentences' do
        paragraph = Paragraph.new max_sentences: 10
        t = paragraph.text

        sentence_count(t).should <= 10
      end
    end

    context 'with maximum and minimum sentences options' do
      it 'returns a paragraph with a number of sentences within the requested range' do
        paragraph = Paragraph.new min_sentences: 7, max_sentences: 10
        t = paragraph.text

        sentence_count(t).should >= 7 
        sentence_count(t).should <= 10
      end
    end
  end
end

def sentence_count(str)
  str.split(/\.\s/).count
end
