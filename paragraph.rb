require_relative 'text.rb'

class Paragraph
  attr_reader :min_sentences, :max_sentences, :words

  def initialize(options={})
    @min_sentences = options[:min_sentences] || 5
    @max_sentences = options[:max_sentences] || 10
  end

  def text
    sentences.split(/\.\s/).first(length).join('. ') + '.'
  end

  def words
    text.split
  end

  private

  def phrases
    phrases = []
    remaining_words = words
    link_count.times do
      phrases << remaining_words.slice!(0, break_point)
    end
    phrases.map { |phrase| phrase.join(' ') }
  end

  def length
    rand min_sentences..max_sentences
  end

  def sentences
    Text.new.sentences
  end
end
