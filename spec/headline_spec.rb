require 'spec_helper'
require_relative '../lib/ipsummer/headline.rb'

describe Headline do
  describe '#complete_text' do
    context 'with no arguments' do
      before { @headline = Headline.new }

      it 'does not end with a period' do
        @headline.complete_text.should_not match /\./
      end

      it 'capitalizes the first letter of each word' do
        words = @headline.complete_text.split

        words.each do |word|
          word.should match /^[A-Z]+[a-z]*$/
        end
      end

      it 'has a word count within the default min and max' do
        word_count(@headline.complete_text).should >= 3
        word_count(@headline.complete_text).should <= 5
      end
    end

    context 'with a period argument' do
      it 'ends with a period' do
        headline = Headline.new period: true

        headline.complete_text.should match /\.$/
      end
    end

    context 'with a min words argument that is <= the default max' do
      before { @headline = Headline.new min_words: 4 }

      it 'has a word count >= the min argument' do
        word_count(@headline.complete_text).should >= 4
      end

      it 'has a word count <= the default max' do
        word_count(@headline.complete_text).should <= 5
      end
    end

    context 'with a min words argument that is > the default max' do
      before { @headline = Headline.new min_words: 7 }

      it 'has a word count >= the min argument' do
        word_count(@headline.complete_text).should >= 7
      end
    end

    context 'with a max words argument that is >= default min' do
      before { @headline = Headline.new max_words: 7 }

      it 'has a word count <= the max argument' do
        word_count(@headline.complete_text).should <= 7
      end

      it 'has a word count >= the default min' do
        word_count(@headline.complete_text).should >= 3
      end
    end

    context 'with a max words argument that is < the default min' do
      before { @headline = Headline.new max_words: 2 }

      it 'has a word count <= the max argument' do
        word_count(@headline.complete_text).should <= 2
      end
    end

    context 'with min and max words arguments' do
      it 'has a word count within the requested min and max' do
        headline = Headline.new min_words: 5, max_words: 10

        word_count(headline.complete_text).should >= 5
        word_count(headline.complete_text).should <= 10
      end
    end
  end
end

def word_count(str)
  str.split.count
end
