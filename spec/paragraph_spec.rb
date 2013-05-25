require 'spec_helper'
require_relative '../lib/ipsummer/paragraph.rb'

describe Paragraph do
  describe '#text' do
    context 'with no arguments' do
      it 'returns a paragraph with the default number of sentences' do
        paragraph = Paragraph.new
        t = paragraph.text

        sentence_count(t).should be_within(5).of(5)
      end
    end

    context 'with a period argument' do
      it 'ends with a period' do
        paragraph = Paragraph.new period: true

        paragraph.text.should match /\.$/
      end
    end

    context 'with a min sentences argument that is <= the default max' do
      before { @paragraph = Paragraph.new min_sentences: 4 }

      it 'has a sentence count >= the min argument' do
        sentence_count(@paragraph.text).should >= 4
      end

      it 'has a sentence count <= the default max' do
        sentence_count(@paragraph.text).should <= 10
      end
    end

    context 'with a min sentences argument that is > the default max' do
      before { @paragraph = Paragraph.new min_sentences: 11 }

      it 'has a sentence count >= the min argument' do
        sentence_count(@paragraph.text).should >= 11
      end
    end

    context 'with a max sentences argument that is >= default min' do
      before { @paragraph = Paragraph.new max_sentences: 7 }

      it 'has a sentence count <= the max argument' do
        sentence_count(@paragraph.text).should <= 10
      end

      it 'has a sentence count >= the default min' do
        sentence_count(@paragraph.text).should >= 5
      end
    end

    context 'with a max sentences argument that is < the default min' do
      before { @paragraph = Paragraph.new max_sentences: 4 }

      it 'has a sentence count <= the max argument' do
        sentence_count(@paragraph.text).should <= 10
      end
    end
  end

  context 'with min and max sentences arguments' do
    it 'has a sentence count within the requested min and max' do
      paragraph = Paragraph.new min_sentences: 4, max_sentences: 9

      sentence_count(paragraph.text).should >= 4
      sentence_count(paragraph.text).should <= 9
    end
  end
end

def sentence_count(str)
  str.split(/\.\s/).count
end
