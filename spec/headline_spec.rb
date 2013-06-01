require 'spec_helper'
require_relative '../lib/ipsummer/headline.rb'

describe Headline do
  describe '#unwrapped_headline' do
    context 'with no arguments' do
      before { @headline = Headline.new }

      it 'does not end with a period' do
        @headline.unwrapped_headline.should_not match /\./
      end

      it 'capitalizes the first letter of each word' do
        words = @headline.unwrapped_headline.split

        words.each do |word|
          word.should match /^[A-Z]+[a-z]*$/
        end
      end
    end

    context 'with a period argument' do
      it 'ends with a period' do
        headline = Headline.new period: true

        headline.unwrapped_headline.should match /\.$/
      end
    end
  end

  describe '#wrapped_headline' do
    context 'with no level option' do
      before { @headline = Headline.new }

      it 'returns a level-1 heading' do
        @headline.wrapped_headline.should match /^<h1>.*<\/h1>$/
      end
    end

    context 'with a valid level option' do
      before { @headline = Headline.new(level: 2) }

      it 'returns the requested level heading' do
        @headline.wrapped_headline.should match /^<h2>.*<\/h2>$/
      end
    end

    context 'with an level option higher than the limit' do
      before { @headline = Headline.new(level: 7) }

      it 'returns the lowest level heading' do
        @headline.wrapped_headline.should match /^<h6>.*<\/h6>$/
      end
    end
  end
end
